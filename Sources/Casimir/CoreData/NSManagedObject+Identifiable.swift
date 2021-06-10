import Foundation
import CoreData

extension NSManagedObject: Identifiable {
    public var id: NSManagedObjectID {
        objectID
    }
}
