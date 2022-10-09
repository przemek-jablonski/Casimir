import Combine

public extension Publisher {
    func sink() -> AnyCancellable {
        sink(receiveCompletion: { _ in }, receiveValue: { _ in })
    }

    func sinkValue(_ output: @escaping (Output) -> Void) -> AnyCancellable {
        sink(receiveCompletion: { _ in }, receiveValue: output)
    }
}
