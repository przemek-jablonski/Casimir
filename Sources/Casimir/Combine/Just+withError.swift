import Combine
import Foundation

private extension Just {
    static func withError<Failure: Error>(
        _ output: Output,
        error: Failure.Type = Failure.self
    ) -> AnyPublisher<Output, Failure> {
        Just(output).setFailureType(to: Failure.self).erased()
    }
}
