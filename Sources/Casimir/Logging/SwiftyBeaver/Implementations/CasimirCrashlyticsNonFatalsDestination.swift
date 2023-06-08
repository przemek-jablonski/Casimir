#if canImport(SwiftyBeaver) && canImport(FirebaseCrashlytics)
import FirebaseCrashlytics
import SwiftyBeaver

/**
 Sends logs of level `nonFatalReportingLevel` to Crashlytics as a non-fatal error record.
 */
public final class CasimirCrashlyticsNonFatalsDestination: CasimirBaseDestinationConfiguration, CasimirLoggingDestination {

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

  public override func send(
    _ level: SwiftyBeaver.Level,
    msg: String,
    thread: String,
    file: String,
    function: String,
    line: Int,
    context: Any? = nil
  ) -> String? {
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
      Crashlytics
        .crashlytics()
        .record(
          exceptionModel: ExceptionModel(
            name: msg,
            reason: string
          )
        )
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
    configure(shortened: &loggingLineFormat)
  }
}
#endif
