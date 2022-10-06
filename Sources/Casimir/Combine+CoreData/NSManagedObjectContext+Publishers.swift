import Combine
import CoreData

public extension NSManagedObjectContext {

    /**
     Returns internal publisher (`ManagedObjectChangesPublisher`) delivering changes of elements
     from given fetch request over time.
     */
    func changesPublisher<T: NSManagedObject>(from fetchRequest: NSFetchRequest<T>)
    -> ContextChangesPublisher<T> {
        ContextChangesPublisher(fetchRequest: fetchRequest, context: self)
    }

    /**
     Delivers changes (`CollectionDifference<T>`) of elements from given fetch request over time.
     So, when fetch request update is triggered, underlying publisher publishes new event in which CHANGES
     of the collection are described (as in `CollectionDifference` protocol).
     */
    func changes<T: NSManagedObject>(from fetchRequest: NSFetchRequest<T>)
    -> AnyPublisher<CollectionDifference<T>, Error> {
        changesPublisher(from: fetchRequest)
            .eraseToAnyPublisher()
    }

    /**
     Delivers updates (`[T]`) of elements from given fetch request over time.
     So, when fetch request update is triggered, underlying publisher publishes new event
     in which new state of element collection is described.
     */
    func updates<T: NSManagedObject>(from fetchRequest: NSFetchRequest<T>)
    -> AnyPublisher<[T], Error> {
        changes(from: fetchRequest)
            .prepend([])
            .scan([]) { current, updates in
                var new = current
                for update in updates {
                    switch update {
                    case .insert(let offset, let element, _):
                        new.insert(element, at: offset)
                    case .remove(let offset, _, _):
                        new.remove(at: offset)
                    }
                }
                return new

            }
            .eraseToAnyPublisher()
    }
}

/**
 https://gist.github.com/mjm/750b20e1dfd5b1abc82b8295b54b3c74
 https://www.mattmoriarity.com/observing-core-data-changes-with-combine/custom-publisher/
 */
public struct ContextChangesPublisher<T: NSManagedObject>: Publisher {
    public typealias Output = CollectionDifference<T>
    public typealias Failure = Error

    let fetchRequest: NSFetchRequest<T>
    let context: NSManagedObjectContext

    init(fetchRequest: NSFetchRequest<T>, context: NSManagedObjectContext) {
        self.fetchRequest = fetchRequest
        self.context = context
    }

    public func receive<S: Subscriber>(subscriber: S) where Failure == S.Failure, Output == S.Input {
        let inner = Inner(downstream: subscriber, fetchRequest: fetchRequest, context: context)
        subscriber.receive(subscription: inner)
    }

    private final class Inner<Downstream: Subscriber>: NSObject, Subscription, NSFetchedResultsControllerDelegate
    where Downstream.Input == CollectionDifference<T>, Downstream.Failure == Error {

        private let downstream: Downstream
        private let fetchedResultsController: NSFetchedResultsController<T>
        private var demand: Subscribers.Demand = .none
        private var lastSentState = [T]()
        private var currentDifferences = CollectionDifference<T>([])!

        init(downstream: Downstream, fetchRequest: NSFetchRequest<T>, context: NSManagedObjectContext) {
            self.downstream = downstream
            fetchedResultsController = NSFetchedResultsController(
                fetchRequest: fetchRequest,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil)

            super.init()
            fetchedResultsController.delegate = self
            do {
                try fetchedResultsController.performFetch()
                updateDiff()
            } catch {
                downstream.receive(completion: .failure(error))
            }
        }

        func request(_ demand: Subscribers.Demand) {
            self.demand += demand
            fulfillDemand()
        }

        private func updateDiff() {
            currentDifferences = Array(fetchedResultsController.fetchedObjects ?? []).difference(from: lastSentState)
            fulfillDemand()
        }

        private func fulfillDemand() {
            if demand > 0 {
                let newDemand = downstream.receive(currentDifferences)
                lastSentState = Array(fetchedResultsController.fetchedObjects ?? [])
                currentDifferences = lastSentState.difference(from: lastSentState)

                demand += newDemand
                demand -= 1
            }
        }

        func cancel() {
            fetchedResultsController.delegate = nil
            //            fetchedResultsController = nil
        }

        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            updateDiff()
        }
    }
}
