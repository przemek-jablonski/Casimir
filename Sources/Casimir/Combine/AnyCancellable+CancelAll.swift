import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Set where Element == AnyCancellable {
    func cancelAll() {
        forEach { $0.cancel() }
    }
}
