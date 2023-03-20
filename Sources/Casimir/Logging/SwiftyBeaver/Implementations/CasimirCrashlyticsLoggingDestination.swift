#if canImport(SwiftyBeaver) && canImport(FirebaseCrashlytics)
import FirebaseCrashlytics
import SwiftyBeaver

/**
 Records every log (of level higher or equal to the `loggingLevelThreshold`) to Crashlytics.
 Logs are not visible in the Crashlytics console, but are attached to the crash reports.

 Logs size are limited to the 64kB circular buffer.
 */
public final class CasimirCrashlyticsLoggingDestination: BaseDestination, CasimirLoggingDestination {

  // swiftlint:disable:next unused_setter_value
  override public var asynchronously: Bool { get { true } set { return } }
  private let loggingLevelThreshold: SwiftyBeaver.Level

  public init(loggingLevelThreshold: SwiftyBeaver.Level) {
    self.loggingLevelThreshold = loggingLevelThreshold
    super.init()
    configure(&levelString)
    configure(&levelColor)
    configure(&format)
  }

  override public func send(
    _ level: SwiftyBeaver.Level,
    msg: String,
    thread: String,
    file: String,
    function: String,
    line: Int,
    context: Any? = nil) -> String? {
    if loggingLevelThreshold <= level,
       let string = super.send(
        level,
        msg: msg,
        thread: thread,
        file: file,
        function: function,
        line: line,
        context: context
       ) {
      Crashlytics.crashlytics().log(string)
      return string
    }

    return nil
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
