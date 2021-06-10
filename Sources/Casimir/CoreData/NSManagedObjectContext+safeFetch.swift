import CoreData
import Combine

extension NSManagedObjectContext {
    func safeFetch<T>(_ request: NSFetchRequest<T>) -> Single<[T], Error> {
        do {
            return .success(content: try fetch(request))
        } catch {
            return .error(error: error)
        }
    }
}
