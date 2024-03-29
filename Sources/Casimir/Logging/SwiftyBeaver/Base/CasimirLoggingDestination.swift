#if canImport(SwiftyBeaver)
import SwiftyBeaver

public protocol CasimirLoggingDestination: BaseDestination {
  func configure(_ levelString: inout BaseDestination.LevelString)
  func configure(_ levelColor: inout BaseDestination.LevelColor)
  func configure(_ loggingLineFormat: inout String)
}
#endif
