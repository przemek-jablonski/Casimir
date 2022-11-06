import Combine
import Entwine
import EntwineTest
import XCTest

public extension TestSequence where Input: Equatable, Failure: Equatable {
    func assertEquals(_ equals: TestSequence) {
        XCTAssertEqual(self, equals)
    }
}
