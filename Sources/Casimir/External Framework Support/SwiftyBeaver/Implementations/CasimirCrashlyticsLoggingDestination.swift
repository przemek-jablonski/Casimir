#if canImport(SwiftyBeaver) && canImport(FirebaseCrashlytics)
import SwiftyBeaver
import FirebaseCrashlytics

/**
 Records every log (of level higher or equal to the `loggingLevelThreshold`) to Crashlytics.
 Logs are not visible in the Crashlytics console, but are attached to the crash reports.
 
 Logs size are limited to the 64kB circular buffer.
 */
public final class CasimirCrashlyticsLoggingDestination: BaseDestination, CasimirLoggingDestination {
    
    //swiftlint:disable:next unused_setter_value
    override public var asynchronously: Bool { get { true } set { return } }
    private let loggingLevelThreshold: SwiftyBeaver.Level
    
    public init(loggingLevelThreshold: SwiftyBeaver.Level) {
        self.loggingLevelThreshold = loggingLevelThreshold
        super.init()
        configure(&levelString)
        configure(&levelColor)
        configure(&format)
    }
    
    override public func send(_ level: SwiftyBeaver.Level,
                              msg: String,
                              thread: String,
                              file: String,
                              function: String,
                              line: Int,
                              context: Any? = nil) -> String? {
        if loggingLevelThreshold <= level,
           let string = super.send(level,
                                   msg: msg,
                                   thread: thread,
                                   file: file,
                                   function: function,
                                   line: line,
                                   context: context) {
            Crashlytics.crashlytics().log(string)
            return string
        }
        
        return nil
    }
    
    public func configure(_ levelString: inout BaseDestination.LevelString) {
        levelString.verbose = "V"
        levelString.debug = "D"
        levelString.info = "I"
        levelString.warning = "W"
        levelString.error = "E"
    }
    
    public func configure(_ levelColor: inout BaseDestination.LevelColor) {
        levelColor.verbose = "🤍 "
        levelColor.debug = "💚 "
        levelColor.info = "💙 "
        levelColor.warning = "🧡 "
        levelColor.error = "❤️ "
    }
    
    public func configure(_ loggingLineFormat: inout String) {
        loggingLineFormat = "$C$L$c/ $N$X.$F - $M"
    }
}
#endif
