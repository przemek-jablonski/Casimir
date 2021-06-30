#if canImport(SwiftyBeaver)
import SwiftyBeaver

public extension SwiftyBeaver {
    static func addDestinations(_ destinations: BaseDestination...) {
        destinations.forEach({ SwiftyBeaver.addDestination($0) })
    }
}
#endif
