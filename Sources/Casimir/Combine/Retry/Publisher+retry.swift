import Combine
import Foundation

public extension Publisher {
    /**
     Tries to recreate failed upstream up to the specified amount of `retries`.
     Each retry will be delayed for predefined `seconds`.
     
     - Note: This modifier will replace the failed upstream with the `catch` operator after specified amount of seconds.
     */
    func retry(withDelay seconds: Double, retries: Int) -> AnyPublisher<Output, Failure> {
        self.catch { _ in self.delay(for: RunLoop.SchedulerTimeType.Stride(seconds), scheduler: RunLoop.main) }
            .retry(retries)
            .erased()
    }
}
