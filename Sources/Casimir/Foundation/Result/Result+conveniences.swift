import Foundation

public extension Result {
  var isSuccess: Bool {
    switch self {
    case .success:
      return true
    default:
      return false
    }
  }

  var isFailure: Bool {
    !isSuccess
  }

  var error: Error? {
    switch self {
    case .success: return nil
    case .failure(let error): return error
    }
  }
}

public extension Result where Success == Void {
  static func success() -> Self { .success(()) }
}

public extension Result where Failure == Error {
  static func failure(_ error: Error? = nil) -> Self { .failure(error ?? EmptyError()) }
}

// TODO: tests
private extension Result where Success == String? {
  func replaceNil(
    with error: Failure
  ) -> Result<String, Failure> {
    self.flatMap { value -> Result<String, Failure> in
      guard let value else {
        return .failure(error)
      }
      return .success(value)
    }
  }
}
