import Combine
import EntwineTest

public extension TestScheduler {
    func subscribe<P: Publisher>(to publisher: P) -> TestableSubscriber<P.Output, P.Failure> {
        let subscriber = self.createTestableSubscriber(P.Output.self, P.Failure.self)
        publisher.subscribe(subscriber)
        self.resume()
        return subscriber
    }
}
