import Casimir
import XCTest

final class ArraySafeGetTestCase: XCTestCase {
  func test_safeGettingValidIndexOnMultipleElementsPrimitiveArray_shouldReturnCorrespondingPrimitive() {
    performSafeGet(
      on: ["a", "b", "c", "d"],
      index: 1,
      assertions: { _, _, result in
        XCTAssertEqual(result, "b")
      }
    )

    performSafeGet(
      on: ["a", "b", "c", "d"],
      index: 2,
      assertions: { _, _, result in
        XCTAssertEqual(result, "c")
      }
    )
  }

  func test_safeGettingValidIndexOnComplexTypeMultipleElementsArray_shouldReturnCorrespondingObject() {
    struct DummyStruct: Equatable {
      let wrapped1: Double
      let wrapped2: String
    }

    let dummyObject = DummyStruct(wrapped1: .random, wrapped2: .random)

    performSafeGet(
      on: [
        DummyStruct(wrapped1: .random, wrapped2: .random),
        dummyObject,
        DummyStruct(wrapped1: .random, wrapped2: .random),
        DummyStruct(wrapped1: .random, wrapped2: .random)
      ],
      index: 1,
      assertions: { _, _, result in
        XCTAssertEqual(result, dummyObject)
      }
    )
  }

  func test_safeGettingLastIndexOnMultipleElementsArray_shouldReturnLastElement() {
    struct DummyStruct: Equatable {
      let wrapped1: Double
      let wrapped2: String
    }

    let dummyObject = DummyStruct(wrapped1: .random, wrapped2: .random)

    performSafeGet(
      on: [
        DummyStruct(wrapped1: .random, wrapped2: .random),
        DummyStruct(wrapped1: .random, wrapped2: .random),
        dummyObject,
        DummyStruct(wrapped1: .random, wrapped2: .random)
      ],
      index: 2,
      assertions: { _, _, result in
        XCTAssertEqual(result, dummyObject)
      }
    )
  }

  func test_safeGetting0IndexOnMultipleElementsArray_shouldReturnFirstElement() {
    performSafeGet(
      on: [0, 1, 2, 3, 4, 5],
      index: 0,
      assertions: { _, _, result in
        XCTAssertEqual(result, 0)
      }
    )
  }

  func test_safeGettingOverflowingIndexOnMultipleElementsArray_shouldReturnNil() {
    performSafeGet(
      on: [0, 1, 2, 3, 4, 5],
      index: 6,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGettingIntMaxIndexOnMultipleElementsArray_shouldReturnNil() {
    performSafeGet(
      on: [0, 1, 2, 3, 4, 5],
      index: Int.max,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGettingNegativeIndexOnMultipleElementsArray_shouldReturnNil() {
    performSafeGet(
      on: [0, 1, 2, 3, 4, 5],
      index: -1,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGettingIntMinIndexOnMultipleElementsArray_shouldReturnNil() {
    performSafeGet(
      on: [0, 1, 2, 3, 4, 5],
      index: Int.min,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGetting0IndexOnSingleElementArray_shouldReturnOnlyElement() {
    performSafeGet(
      on: [0],
      index: 0,
      assertions: { _, _, result in
        XCTAssertEqual(result, 0)
      }
    )
  }

  func test_safeGettingOverflowingIndexOnSingleElementArray_shouldReturnNil() {
    performSafeGet(
      on: [0],
      index: 1,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGettingNegativeIndexOnSingleElementArray_shouldReturnNil() {
    performSafeGet(
      on: [0],
      index: -1,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGetting0IndexOnEmptyArray_shouldReturnNil() {
    performSafeGet(
      on: [Int](),
      index: 0,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGettingOverflowingIndexOnEmptyArray_shouldReturnNil() {
    performSafeGet(
      on: [Int](),
      index: 1,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }

  func test_safeGettingNegativeIndexOnEmptyArray_shouldReturnNil() {
    performSafeGet(
      on: [Int](),
      index: -1,
      assertions: { _, _, result in
        XCTAssertEqual(result, nil)
      }
    )
  }
}

private extension XCTestCase {
  func performSafeGet<Element>(
    on array: [Element],
    index: Int,
    assertions: (_ array: [Element], _ index: Int, _ result: Element?) -> ()
  ) {
    let result = array.safeGet(index: index)
    assertions(
      array,
      index,
      result
    )
  }
}
