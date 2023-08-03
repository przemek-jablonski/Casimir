import Foundation

/**
 Wrapper for a set of data (models), meant to represent common data fetching states in type-safe way.
 */
public enum Loadable<Model: Equatable>: Equatable {
  case loading
  case loaded(_ data: Model)
  case failure(_ error: Error)
  // TODO: this has inherent flaw of erasing all of the data if subsequent data fetching will fail

  public static func == (
    lhs: Self,
    rhs: Self
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

