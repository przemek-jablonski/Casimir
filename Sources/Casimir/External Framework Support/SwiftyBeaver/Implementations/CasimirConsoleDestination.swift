#if canImport(SwiftyBeaver)
import SwiftyBeaver

public final class CasimirConsoleDestination: BaseDestination, CasimirLoggingDestination {
    private let console: ConsoleDestination
    
    public override init() {
        self.console = ConsoleDestination()
        super.init()
        configure(&self.console.levelString)
        configure(&self.console.levelColor)
        configure(&self.console.format)
    }
    public override func send(_ level: SwiftyBeaver.Level,
                              msg: String,
                              thread: String,
                              file: String,
                              function: String,
                              line: Int,
                              context: Any? = nil) -> String? {
        console.send(level, msg: msg, thread: thread, file: file, function: function, line: line, context: context)
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
        loggingLineFormat = "$DHH:mm:ss:SSS$d $C$L$c/ $N$X.$F:$l - $M"
    }
}
#endif
