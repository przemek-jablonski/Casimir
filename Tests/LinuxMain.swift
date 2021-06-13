#if !os(watchOS)
import XCTest

import CasimirTests

var tests = [XCTestCaseEntry]()
tests += CasimirTests.allTests()
XCTMain(tests)
#endif
