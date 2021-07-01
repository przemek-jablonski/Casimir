import XCTest
@testable import Casimir

final class NumberToStringConversionsTestCase: XCTestCase {
    // add leadingZeroes and decimalPlaces to other types
    // test chaining
    func test() {
        let asd1 = 10.string(leadingZeroes: 0)
        let asd2 = 10.string(leadingZeroes: 2)
        let asd3 = 10.string(leadingZeroes: 5)
        let asd4 = 10.0.string(decimalPlaces: 0)
        let asd5 = 10.0.string(decimalPlaces: 1)
        let asd6 = 10.0.string(decimalPlaces: 2)
        let asd7 = 10.0.string(decimalPlaces: 5)
        XCTAssertTrue(true)
    }
}
