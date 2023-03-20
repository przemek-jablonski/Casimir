import CoreData

extension NSFetchRequest {
  @objc convenience init(entityName: String, sortDescriptors: [NSSortDescriptor]) {
    self.init(entityName: entityName)
    self.sortDescriptors = sortDescriptors
  }

  @objc convenience init(entityName: String, sortDescriptor: NSSortDescriptor) {
    self.init(entityName: entityName)
    self.sortDescriptors = [sortDescriptor]
  }
}
