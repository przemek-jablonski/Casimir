import CoreData
import Foundation

extension NSManagedObject: Identifiable {
  public var id: NSManagedObjectID {
    objectID
  }
}
