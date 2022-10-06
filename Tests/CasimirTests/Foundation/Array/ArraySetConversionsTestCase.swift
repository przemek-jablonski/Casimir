import XCTest
@testable import Casimir

final class ArraySetConversionsTestCase: XCTestCase {
    func test_givenEmptyArray_shouldConvertToEmptySet() {
        let array: [Int] = []
        let set: Set<Int> = []
        XCTAssertEqual(array.set, set)
    }

    func test_givenFilledArray_shouldConvertToSetPreservingOrder() {
        let array: Array = [1, 2, 3, 4]
        let set: Set = [1, 2, 3, 4]
        XCTAssertEqual(array.set, set)
    }

    func test_givenEmptySet_shouldConvertToEmptyArray() {
        let array: [Int] = []
        let set: Set<Int> = []
        XCTAssertEqual(set.array, array)
    }

    func test_givenFilledSet_shouldConvertToArrayPreservingOrder() {
        let set: Set = [1, 2, 3, 4]
        let array: Array = [1, 2, 3, 4]
        XCTAssertEqual(set.array.sorted(), array)
    }
}
