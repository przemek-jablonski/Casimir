#if canImport(SwiftyBeaver)
import SwiftyBeaver

open class CasimirBaseDestinationConfiguration: BaseDestination {
    public func configure(default levelColor: inout BaseDestination.LevelColor) {
        levelColor.verbose = "⚫️⚪️"
        levelColor.debug = "⚫️🟢"
        levelColor.info = "⚫️🔵"
        levelColor.warning = "⚫️🟠"
        levelColor.error = "⚫️🔴"
    }

    public func configure(default levelString: inout BaseDestination.LevelString) {
        levelString.verbose = "V"
        levelString.debug = "D"
        levelString.info = "I"
        levelString.warning = "W"
        levelString.error = "E"
    }

    public func configure(default loggingLineFormat: inout String) {
        loggingLineFormat = "$DHH:mm:ss:SSS$d $C$L$c / $N.$F:$l - $M $X"
    }

    public func configure(shortened loggingLineFormat: inout String) {
        loggingLineFormat = "$C$L$c / $N.$F:$l - $M $X"
    }
}
#endif
