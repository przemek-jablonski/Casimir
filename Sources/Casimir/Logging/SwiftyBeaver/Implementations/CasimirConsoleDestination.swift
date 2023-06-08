#if canImport(SwiftyBeaver)
import SwiftyBeaver

public final class CasimirConsoleDestination: CasimirBaseDestinationConfiguration, CasimirLoggingDestination {
  private let console: ConsoleDestination

  public override init() {
    self.console = ConsoleDestination()
    super.init()
    configure(&self.console.levelString)
    configure(&self.console.levelColor)
    configure(&self.console.format)
  }
  public override func send(
    _ level: SwiftyBeaver.Level,
    msg: String,
    thread: String,
    file: String,
    function: String,
    line: Int,
    context: Any? = nil
  ) -> String? {
    console.send(
      level,
      msg: msg,
      thread: thread,
      file: file,
      function: function,
      line: line,
      context: context
    )
  }

  public func configure(_ levelString: inout BaseDestination.LevelString) {
    configure(default: &levelString)
  }

  public func configure(_ levelColor: inout BaseDestination.LevelColor) {
    configure(default: &levelColor)
  }

  public func configure(_ loggingLineFormat: inout String) {
    configure(default: &loggingLineFormat)
  }
}
#endif
