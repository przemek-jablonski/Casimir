#if canImport(SwiftyBeaver)
import SwiftyBeaver

extension SwiftyBeaver.Level: Comparable {
    public static func < (lhs: SwiftyBeaver.Level, rhs: SwiftyBeaver.Level) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
#endif
