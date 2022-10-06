import XCTest
@testable import Casimir

final class ArrayRemoveDuplicatesTestCase: XCTestCase {
    func test_removingDupesFromEmptyArray_shouldReturnEmptyArray() {
        XCTAssertEqual([Int]().removeDuplicates(), [])
    }

    func test_removingDupesFromUniqueIntsArray_shouldNotChangeArrayElements() {
        XCTAssertEqual([1, 3, 40, 35, 2, -1, 1000].removeDuplicates(), [1, 3, 40, 35, 2, -1, 1000])
    }

    func test_removingDupesFromIntsArrayWithOneDuplicate_shouldRemoveDuplicatesAndPreserveOrder() {
        XCTAssertEqual([1, 3, 40, 35, 2, 2, -1, 1000].removeDuplicates(), [1, 3, 40, 35, 2, -1, 1000])
    }

    func test_removingDupesFromIntsArrayWithMultipleDuplicates_shouldRemoveDuplicatesAndPreserveOrder() {
        XCTAssertEqual([1, 3, 40, 35, 2, 2, 2, -1, 1000, 3, 1, 3].removeDuplicates(), [1, 3, 40, 35, 2, -1, 1000])
    }

    func test_removingDupesFromIntsArrayWithDuplicatesOnly_shouldRemoveDuplicatesAndPreserveOrder() {
        XCTAssertEqual([6, 6, 6].removeDuplicates(), [6])
    }

    func test_removingDupesFromUniqueStringsArray_shouldNotChangeArrayElements() {
        XCTAssertEqual(["b", "Lorem", "Ipsum", "a"].removeDuplicates(), ["b", "Lorem", "Ipsum", "a"])
    }

    func test_removingDupesFromStringsArrayWithOneDuplicate_shouldRemoveDuplicatesAndPreserveOrder() {
        XCTAssertEqual(["b", "Lorem", "Ipsum", "a", "Lorem"].removeDuplicates(), ["b", "Lorem", "Ipsum", "a"])
    }

    func test_removingDupesFromStringsArrayWithMultipleDuplicates_shouldRemoveDuplicatesAndPreserveOrder() {
        XCTAssertEqual(["b", "Lorem", "Ipsum", "a", "a", "Lorem", "a"].removeDuplicates(), ["b", "Lorem", "Ipsum", "a"])
    }

    func test_removingDupesFromStringsArrayWithDuplicatesOnly_shouldRemoveDuplicatesAndPreserveOrder() {
        XCTAssertEqual(["6", "6", "6"].removeDuplicates(), ["6"])
    }
}
