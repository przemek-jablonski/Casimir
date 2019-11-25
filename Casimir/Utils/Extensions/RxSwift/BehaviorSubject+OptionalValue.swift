import RxSwift

public extension BehaviorSubject {

    var latest: Element? {
        do {
            return try value()
        } catch {
            return nil
        }
    }
    
}
