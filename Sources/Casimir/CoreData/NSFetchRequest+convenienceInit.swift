import CoreData

public extension NSFetchRequest {
  /**
   Initializes a fetch request configured with a given entity name and multiple sort descriptors.
   */
  @objc
  convenience init(
    entityName: String,
    sortDescriptors: [NSSortDescriptor]
  ) {
    self.init(entityName: entityName)
    self.sortDescriptors = sortDescriptors
  }

  /**
   Initializes a fetch request configured with a given entity name and sort descriptor.
   */
  @objc
  convenience init(
    entityName: String,
    sortDescriptor: NSSortDescriptor
  ) {
    self.init(entityName: entityName)
    self.sortDescriptors = [sortDescriptor]
  }
}
