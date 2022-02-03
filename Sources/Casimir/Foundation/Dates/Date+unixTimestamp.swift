import Foundation

public extension Date {
    var unixTimestamp: UnixTimestamp {
        timeIntervalSince1970
    }
}
