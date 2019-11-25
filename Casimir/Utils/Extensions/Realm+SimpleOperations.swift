import RealmSwift
import RxSwift

internal typealias RealmSortQuery = (keyPath: String, ascending: Bool)

internal extension Realm {
    /**
        Queries for persisted objects of given `type` and performs `subscribeCallback`
        for each update of this collection. Performs `subscribeCallback` immediately on subscription as well.
        - Parameter type: Type of objects to query for.
        - Parameter disposables: `DisposableGroup` into which this stream's disposable will be added.
        - Parameter subscribeCallback: Operation to perform on update.
        - Returns: `Realm` object for chaining. Result can be discarded.
     */
    @discardableResult
    func listenForChanges<Element: Object>(
        of type: Element.Type,
        disposedBy disposables: DisposablesGroup,
        performing subscribeCallback: ((Event<[Element]>) -> ())? = nil) -> Realm {
        Observable.array(from: objects(type))
            .subscribe { subscribeCallback?($0) ?? Log.info($0) }
            .disposed(by: disposables)
        return self
    }

    func objects<Element: Object>(of type: Element.Type) -> Observable<[Element]> {
        Observable.array(from: objects(type))
    }

    func objects<Element: Object>(of type: Element.Type, sorting: RealmSortQuery) -> Observable<[Element]> {
        Observable.array(from: objects(type).sorted(byKeyPath: sorting.keyPath, ascending: sorting.ascending))
    }

    func add<Element: Object, KeyType> (
        object: Element,
        removingDuplicateBy duplicatePrimaryKey: KeyType? = nil) -> Single<Element> {
        Single.create { [weak self] single in
            do {
                try self?.write {
                    if let key = duplicatePrimaryKey { self?.deleteObject(ofType: Element.self, forPrimaryKey: key) }
                    self?.add(object)
                }
                single(.success(object))
            } catch {
                single(.error(error))
            }
            return Disposables.create()
        }
    }

    /**
        Retrieves object of given `type`, using it's `primaryKey` and applies `updateClosure` to it.
        If object is not found, then `databaseKitObjectForPrimaryKeyDoesntExist` will be returned in stream.
     */
    func updateObject<Element: Object, KeyType> (
        of type: Element.Type,
        for primaryKey: KeyType,
        applying updateClosure: @escaping (Element) -> (Element)) -> Single<Element> {
        Single.create { [weak self] single in
            do {
                if let target = self?.object(ofType: type, forPrimaryKey: primaryKey) {
                    try self?.write {
                        single(.success(updateClosure(target)))
                    }
                } else {
                    single(.error(DatabaseKitManagerError.databaseKitObjectForPrimaryKeyDoesntExist(primaryKey)))
                }
            } catch {
                single(.error(error))
            }
            return Disposables.create()
        }
    }
}
