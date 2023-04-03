//

import Foundation

// public extension Result {
//  func replaceError(with Element: Success) -> Result<Success, Never> {
//    self.flatMapError(<#T##transform: (Error) -> Result<Success, Error>##(Error) -> Result<Success, Error>#>)
//    self.flatMapError { error in
//
//    }
//  }
// }

// public extension Result {
//  func ignoreError() -> some Result<Success, Never> {
//
//  }
// }

// public extension Result where Failure == Never {
//  func success() -> Success {
//    do {
//      return try self.get()
//    } catch {
//      // ...
//    }
//  }
// }

public extension Result {
  /// Performs the supplied `closure` content whenever the returned value is a success.
  func onSuccess(
    perform closure: (Success) -> ()
  ) -> Result {
    self.map { success in
      closure(success)
      return success
    }
  }

  /// Performs the supplied `closure` content whenever the returned value is an error.
  func onFailure(
    perform closure: (Failure) -> ()
  ) -> Result {
    self.mapError { failure in
      closure(failure)
      return failure
    }
  }

  /// Performs the supplied `closure` content whenever the `Result` returns any value, both success and failure.
  func onEvent(
    perform closure: (Self) -> ()
  ) -> Result {
    self
      .map { success in
        closure(self)
        return success
      }
      .mapError { failure in
        closure(self)
        return failure
      }
  }
}
