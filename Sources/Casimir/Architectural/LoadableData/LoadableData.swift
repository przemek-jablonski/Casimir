import Foundation

/// Wrapper for a set of data (models), meant to represent common data fetching states in type-safe way.
public enum LoadableData<Model: Equatable>: Equatable {
  case loading
  case loaded(_ data: Model)
  case failure(_ error: Error) // TODO: make it a localizable string maybe or something?
  // TODO: for DEBUG it would be nice if it printed whole error msgs

  public var loading: Void? {
    self == .loading ? () : nil
  }

  public var loaded: Void? {
    switch self {
      case .loaded(_):
        return ()
        //        return data
      default:
        return nil
    }
  }

  public var failure: Void? {
    switch self {
      case .failure(_):
        return ()
        //        return error
      default:
        return nil
    }
  }

  public static func == (
    lhs: LoadableData<Model>,
    rhs: LoadableData<Model>
  ) -> Bool {
    switch (lhs, rhs) {
      case (.loading, .loading):
        return true
      case (.loaded(let lhs), .loaded(let rhs)):
        return lhs == rhs
      case (.failure(let lhs), .failure(let rhs)):
        return lhs.localizedDescription == rhs.localizedDescription
      default:
        return false
    }
  }
}

public enum GenericLoadError: ErrorProtocol {
  case genericError(Error)

}

extension GenericLoadError {
  public static func random(
    _ randomNumberGenerator: inout RandomNumberGenerator
  ) -> Self {
    .genericError(GenericError(description: .random(&randomNumberGenerator)))
  }

  public static func == (lhs: GenericLoadError, rhs: GenericLoadError) -> Bool {
    lhs.localizedDescription == rhs.localizedDescription
  }
}
