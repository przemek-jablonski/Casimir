import RxSwift

public extension ObservableType {

    func debugConditionally() -> Observable<Element> {
        #if DEBUG
            return self.debug()
        #else
            return self.asObservable()
        #endif
    }
    
}
