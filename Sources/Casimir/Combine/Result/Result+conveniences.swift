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
}

public extension Result where Success == Void {
  static func success() -> Self { .success(()) }
}

public extension Result where Failure == Error {
  static func failure(_ error: Error? = nil) -> Self { .failure(error ?? EmptyError()) }
}
