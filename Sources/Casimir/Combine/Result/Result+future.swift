import Combine
import Foundation

public extension Result {
    /**
     Converts `Result` into the (immediate) `Future` publisher.
     */
    func future() -> Future<Success, Failure> {
        Future { $0(self) }
    }
}
