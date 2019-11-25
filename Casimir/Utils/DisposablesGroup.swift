import RxSwift

/**
    Groups disposables together, so that it easy to dispose them all at once, whether it's when
    parent is deinitializing or ViewController lifecycle event happening, such as `viewDidDisappear`.

    Based upon RxSwift's `DisposableBag`, but without additional overhead of
    calculating `DisposeKey`s, key hash matching upon disposal etc.
 */
public class DisposablesGroup {

    private var disposableArray = [Disposable]()

    public init() {

    }

    public func add(_ disposables: Disposable...) {
        disposableArray.append(contentsOf: disposables)
    }

    public func disposeAll() {
        disposableArray.forEach { $0.dispose() }
        disposableArray.removeAll()
    }

}

public extension Disposable {
    func disposed(by disposablesGroup: DisposablesGroup) {
        disposablesGroup.add(self)
    }
}
