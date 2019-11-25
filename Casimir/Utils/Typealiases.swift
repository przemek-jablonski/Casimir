import RxSwift

public typealias Second = TimeInterval
public typealias Meter = Double
public typealias Succeeded = Bool

public typealias UnixTimestamp = TimeInterval
// TODO: implement coordinates validation (there is a range of -180, +179.9 for each value)
public typealias Coordinates = (latitude: Double, longitude: Double)
public typealias Span = (latitudeDelta: Double, longitudeDelta: Double)

public typealias Enabled = Bool

public extension Second {
    func asRxTimeInterval() -> RxTimeInterval {
        return RxTimeInterval.seconds(Int(self))
    }
}
