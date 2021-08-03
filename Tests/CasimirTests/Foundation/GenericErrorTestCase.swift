import XCTest
@testable import Casimir

#if !os(watchOS)

final class GenericErrorTestCase: XCTestCase {
    func test_storingErrorInGenericErrorInstance_shouldReturnUnalteredError() {
        let error: Error = MTLLibraryError(.compileWarning)
        let genericError = GenericError(error: error)
        // TODO: this smells like university-grade code after a night of drinking binge
        XCTAssertTrue((genericError.error as! MTLLibraryError) == error as! MTLLibraryError)
    }
}


#endif
