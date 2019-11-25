import RxSwift

//public typealias OnNextCallback = ((String) -> Void)
public typealias OnErrorCallback = ((Error) -> Void)
public typealias OnCompletedCallback = (() -> Void)
public typealias OnDisposedCallback = (() -> Void)

public extension Disposable {
    /**
     Adds `self` (`Disposable`) to the `CompositeDisposable`.
     - Parameter disposable: `CompositeDisposable` object into which `Disposable` is inserted.
    */
    func disposed(by disposable: CompositeDisposable) {
        _ = disposable.insert(self)
    }
}

public extension Observable {
    /**
        Filters optionals from the stream and returns non-optional types of Elements.
     */
    func filterOptionals<T>() -> Observable<T> where Element == T? {
        return self.filter { $0 != nil }.map { $0! }
    }

    func doOnNext(_ operations: @escaping (Element) -> (Void)) -> Observable<Element> {
        return self.do(onNext: { operations($0) })
    }

    func doOnSubscribe(_ operations: @escaping () -> (Void)) -> Observable<Element> {
        return self.do(onSubscribe: { operations() })
    }

    func doOnDispose(_ operations: @escaping () -> (Void)) -> Observable<Element> {
        return self.do(onDispose: { operations() })
    }

    func doOnError(_ operations: @escaping (Error) -> (Void)) -> Observable<Element> {
        return self.do(onError: { operations($0) })
    }
}

public extension Event {
    /**
     Force-returns non-optional `Element` from the `Event`.
    */
    var value: Element {
        return self.element!
    }
}
