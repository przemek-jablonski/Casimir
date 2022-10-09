import Combine
import Foundation

public extension Publisher {
    func receiveOn(queue: DispatchQueue) -> Publishers.ReceiveOn<Self, DispatchQueue> {
        self.receive(on: queue)
    }

    func subscribeOn(queue: DispatchQueue) -> Publishers.SubscribeOn<Self, DispatchQueue> {
        self.subscribe(on: queue)
    }
}
