import RealmSwift

extension Realm {
    /**
     Overload for Realm's `delete` method. Deletes persisted RealmObject but only if it's not nil. If it is, then
     it falls through, without performing operation.

     - Parameter object: Object to perform deletion on.

     - Note: Useful for chaining with query operation (`realm.delete(realm.object(ofType: ..., forPrimaryKey: ...))`,
     will not throw if queried object was not found.
     */
    func delete(_ object: Object?) {
        if let object = object {
            delete(object)
        }
    }

    /**
     Finds an object of given type in Realm and then deletes it. If object cannot be found,
     then deletion will not take place at all and appropriate return tuple will be returned.

     - Returns: Tuple with boolean `true` if deletion succeeded (`false` otherwise) and optional `Error` (if occured)
     */
    @discardableResult
    func deleteObject<Element: Object, KeyType>(
        ofType type: Element.Type,
        forPrimaryKey key: KeyType) -> (Bool, Error?) {
        do {
            if isInWriteTransaction {
                delete(object(ofType: type, forPrimaryKey: key))
            } else {
                try write {
                    delete(object(ofType: type, forPrimaryKey: key))
                }
            }
            return (true, nil)
        } catch {
            return (false, error as? Realm.Error)
        }
    }
}
