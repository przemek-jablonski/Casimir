import RxSwift

public extension ObservableType {

    /**
        Shorthand for subscribing to `Observable` (of `ObservableType`).
     */
    @inline(__always)
    func subscribeOnNext(_ onNextClosure: @escaping (Element) -> Void) -> Disposable {
        return self.subscribe(
            onNext: onNextClosure,
            onError: nil,
            onCompleted: nil,
            onDisposed: nil)
    }

}
