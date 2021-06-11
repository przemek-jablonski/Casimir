import Combine

public extension Set where Element == AnyCancellable {
    func cancelAll() {
        forEach { $0.cancel() }
    }
}
