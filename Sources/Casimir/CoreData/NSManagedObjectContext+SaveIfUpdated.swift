import Foundation
import CoreData
import Combine

public extension NSManagedObjectContext {
    /**
     Executes operations contained in the `operations` closure, performs CoreData save and returns the result.
     */
    func performAndSave(_ operations: @escaping (NSManagedObjectContext) -> ()) -> AnyPublisher<Void, Error> {
        Future<Void, Error> ({ promise in
//            log.verbose(self, "")
            operations(self)
            do {
                if self.hasChanges {
                    try self.save()
                    promise(.success(()))
                } else {
                    promise(.failure(NSError())) // TODO:
//                    log.error(self, "Saving cancelled, no changes in CoreData detected.")
//                    promise(.failure(.databaseInsertRequestedWithNoData))
                }
            } catch {
                promise(.failure(NSError())) // TODO:
//                log.error(self, "Core Data saving failed. Error: \(error)")
//                promise(.failure(.databaseInsertGenericError(error: error)))
            }

        }).deferredErased()
    }
}
