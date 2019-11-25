import Foundation

public extension Array {
    func get(from index: Int) -> Element? {
        if index < 0 || index > self.count - 1 {
            return nil
        }
        return self[index]
    }
}

public extension Array {

    /**
     Returns array element indexing from the end, so element for reversedIndex 0 will return
     last element of the array, instead of the first.

     - Warning: If provided index is outside bounds of the array
     (eg. providing 10 as reverseIndex of 9-element array), then this method will throw.
     */
    func item(withReverseIndexing reversedIndex: Int) throws -> Element {
        self[count - (reversedIndex+1)]
    }

    /**
     Returns array element indexing from the end, so element for reversedIndex 0 will return
     last element of the array, instead of the first.

     - Note: If provided index is outside bounds of the array
     (eg. providing 10 as reverseIndex of 9-element array), then this method will return nil.
     */
    func item(withSafeReverseIndexing reversedIndex: Int) -> Element? {
        self.get(from: count - (reversedIndex+1))
    }

}
