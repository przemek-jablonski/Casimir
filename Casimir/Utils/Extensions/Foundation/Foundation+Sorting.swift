import Foundation

// TODO: TEST THAT THOROUGLY
public extension Array {

    /**
     Sorts Array in place using `NSSortDescriptor` instead of `(E, E) -> Bool` predicate.

     - Note: Uses in place sorting provided by the Foundation. Mutating.
     */
    mutating func sort(using descriptor: NSSortDescriptor) -> [Element] {
        sort(by: { descriptor.compare($0, to: $1).rawValue >= 0 })
        return self
    }

}

public extension Set {

    /**
     Sorts Array in place using `NSSortDescriptor` instead of `(E, E) -> Bool` predicate.
     
     - Note: Uses in sorting provided by the Foundation and thus changes return type to Array.
     */
    func sort(using descriptor: NSSortDescriptor) -> [Element] {
        return sorted { descriptor.compare($0, to: $1).rawValue >= 0 }
    }

}
