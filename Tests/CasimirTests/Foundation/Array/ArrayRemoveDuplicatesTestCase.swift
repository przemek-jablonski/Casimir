@testable import Casimir
import XCTest

//final class ArrayRemovingDuplicatesTestCase: XCTestCase {
//  func test_removingDupesFromEmptyArray_shouldReturnEmptyArray() {
//    XCTAssertEqual([Int]().unique(), [])
//  }
//
//  func test_removingDupesFromUniqueIntsArray_shouldNotChangeArrayElements() {
//    XCTAssertEqual([1, 3, 40, 35, 2, -1, 1000].unique(), [1, 3, 40, 35, 2, -1, 1000])
//  }
//
//  func test_removingDupesFromIntsArrayWithOneDuplicate_shouldremovingDuplicatesAndPreserveOrder() {
//    XCTAssertEqual([1, 3, 40, 35, 2, 2, -1, 1000].unique(), [1, 3, 40, 35, 2, -1, 1000])
//  }
//
//  func test_removingDupesFromIntsArrayWithMultipleDuplicates_shouldremovingDuplicatesAndPreserveOrder() {
//    XCTAssertEqual([1, 3, 40, 35, 2, 2, 2, -1, 1000, 3, 1, 3].unique(), [1, 3, 40, 35, 2, -1, 1000])
//  }
//
//  func test_removingDupesFromIntsArrayWithDuplicatesOnly_shouldremovingDuplicatesAndPreserveOrder() {
//    XCTAssertEqual([6, 6, 6].unique(), [6])
//  }
//
//  func test_removingDupesFromUniqueStringsArray_shouldNotChangeArrayElements() {
//    XCTAssertEqual(["b", "Lorem", "Ipsum", "a"].unique(), ["b", "Lorem", "Ipsum", "a"])
//  }
//
//  func test_removingDupesFromStringsArrayWithOneDuplicate_shouldremovingDuplicatesAndPreserveOrder() {
//    XCTAssertEqual(["b", "Lorem", "Ipsum", "a", "Lorem"].unique(), ["b", "Lorem", "Ipsum", "a"])
//  }
//
//  func test_removingDupesFromStringsArrayWithMultipleDuplicates_shouldremovingDuplicatesAndPreserveOrder() {
//    XCTAssertEqual(["b", "Lorem", "Ipsum", "a", "a", "Lorem", "a"].unique(), ["b", "Lorem", "Ipsum", "a"])
//  }
//
//  func test_removingDupesFromStringsArrayWithDuplicatesOnly_shouldremovingDuplicatesAndPreserveOrder() {
//    XCTAssertEqual(["6", "6", "6"].unique(), ["6"])
//  }
//}
