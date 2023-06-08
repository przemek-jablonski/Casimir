import Casimir
import XCTest

final class ArrayToDictionaryConversionTestCase: XCTestCase {
  func test_convertingMultiElementArrayToDictionary_shouldResultInValidDictionary() {
    struct DummyIdentifiable: Identifiable, Equatable {
      let id: Int
      let string: String
    }

    let dummy0 = DummyIdentifiable(id: 0, string: .random())
    let dummy1 = DummyIdentifiable(id: 1, string: .random())
    let dummy2 = DummyIdentifiable(id: 2, string: .random())

    performDictionaryConversion(
      from: [
        dummy0,
        dummy1,
        dummy2
      ],
      resultsIn: [
        dummy0.id: dummy0,
        dummy1.id: dummy1,
        dummy2.id: dummy2
      ]
    )
  }

  func test_convertingMultiElementArrayWithDuplicatedIdsToDictionary_shouldResultInValidDictionary() {
    struct DummyIdentifiable: Identifiable, Equatable {
      let id: Int
      let string: String
    }

    let dummy0 = DummyIdentifiable(id: 0, string: "dummy0")
    let dummy1 = DummyIdentifiable(id: 1, string: "dummy1")
    let dummy2 = DummyIdentifiable(id: 2, string: "dummy2")
    let dummy2Duplicate = DummyIdentifiable(id: dummy2.id, string: "dummy2Duplicate")

    performDictionaryConversion(
      from: [
        dummy0,
        dummy1,
        dummy2,
        dummy2Duplicate
      ],
      resultsIn: [
        dummy0.id: dummy0,
        dummy1.id: dummy1,
        dummy2.id: dummy2Duplicate
      ]
    )
  }

  func test_convertingArrayWithSharedIdToDictionary_shouldResultInOneElementDictionary() {
    struct DummyIdentifiable: Identifiable, Equatable {
      let id: Int
      let string: String
    }

    let dummy0 = DummyIdentifiable(id: 0, string: "dummy0")
    let dummy1 = DummyIdentifiable(id: 0, string: "dummy1")
    let dummy2 = DummyIdentifiable(id: 0, string: "dummy2")

    performDictionaryConversion(
      from: [
        dummy0,
        dummy1,
        dummy2
      ],
      resultsIn: [
        dummy2.id: dummy2
      ]
    )
  }

  func test_convertingEmptyArrayToDictionary_shouldResultInEmptyDictionary() {
    struct DummyIdentifiable: Identifiable, Equatable {
      let id: Int
      let string: String
    }

    performDictionaryConversion(
      from: [DummyIdentifiable](),
      resultsIn: [DummyIdentifiable.ID: DummyIdentifiable]()
    )
  }
}

private extension XCTestCase {
  func performDictionaryConversion<Element: Identifiable & Equatable>(
    from array: [Element],
    resultsIn expectedDictionary: [Element.ID: Element]
  ) {
    performDictionaryConversion(
      from: array,
      assertions: { _, result in
        XCTAssertEqual(result, expectedDictionary)
      }
    )
  }

  private func performDictionaryConversion<Element: Identifiable>(
    from array: [Element],
    assertions: (_ array: [Element], _ result: [Element.ID: Element]) -> ()
  ) {
    let result = array.dictionary
    assertions(array, result)
  }
}

// case 3: jakie value bedzie?
