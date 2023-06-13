@testable import Casimir
import XCTest

internal final class ArrayRemovingDuplicatesTestCase: XCTestCase {
  internal func test_removingDupesFromEmptyArray_shouldReturnEmptyArray() {
    XCTAssertEqual([Int]().removingDuplicates(), [])
  }

  internal func test_removingDupesFromUniqueIntsArray_shouldNotChangeArrayElements() {
    XCTAssertEqual([1, 3, 40, 35, 2, -1, 1000].removingDuplicates(), [1, 3, 40, 35, 2, -1, 1000])
  }

  internal func test_removingDupesFromIntsArrayWithOneDuplicate_shouldremovingDuplicatesAndPreserveOrder() {
    XCTAssertEqual([1, 3, 40, 35, 2, 2, -1, 1000].removingDuplicates(), [1, 3, 40, 35, 2, -1, 1000])
  }

  internal func test_removingDupesFromIntsArrayWithMultipleDuplicates_shouldremovingDuplicatesAndPreserveOrder() {
    XCTAssertEqual([1, 3, 40, 35, 2, 2, 2, -1, 1000, 3, 1, 3].removingDuplicates(), [1, 3, 40, 35, 2, -1, 1000])
  }

  internal func test_removingDupesFromIntsArrayWithDuplicatesOnly_shouldremovingDuplicatesAndPreserveOrder() {
    XCTAssertEqual([6, 6, 6].removingDuplicates(), [6])
  }

  internal func test_removingDupesFromUniqueStringsArray_shouldNotChangeArrayElements() {
    XCTAssertEqual(["b", "Lorem", "Ipsum", "a"].removingDuplicates(), ["b", "Lorem", "Ipsum", "a"])
  }

  internal func test_removingDupesFromStringsArrayWithOneDuplicate_shouldremovingDuplicatesAndPreserveOrder() {
    XCTAssertEqual(["b", "Lorem", "Ipsum", "a", "Lorem"].removingDuplicates(), ["b", "Lorem", "Ipsum", "a"])
  }

  internal func test_removingDupesFromStringsArrayWithMultipleDuplicates_shouldremovingDuplicatesAndPreserveOrder() {
    XCTAssertEqual(["b", "Lorem", "Ipsum", "a", "a", "Lorem", "a"].removingDuplicates(), ["b", "Lorem", "Ipsum", "a"])
  }

  internal func test_removingDupesFromStringsArrayWithDuplicatesOnly_shouldremovingDuplicatesAndPreserveOrder() {
    XCTAssertEqual(["6", "6", "6"].removingDuplicates(), ["6"])
  }
}
