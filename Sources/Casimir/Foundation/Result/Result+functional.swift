import Foundation

// TODO: tests for this (and methods in /Result as well)
// MARK: - FlatMap (Concatenation)

public extension Result where Success: Sequence {
  func map<NewSuccess>(
    _ transform: (Success.Element) -> NewSuccess
  ) -> Result<[NewSuccess], Failure> {
    switch self {
    case .success(let success): return .success(success.map(transform))
    case .failure(let error): return .failure(error)
    }
  }

  func flatMap<SegmentOfResult>(
    _ transform: (Success.Element) -> SegmentOfResult
  ) -> Result<[SegmentOfResult.Element], Failure> where SegmentOfResult: Sequence {
    switch self {
    case .success(let success): return .success(success.flatMap(transform))
    case .failure(let error): return .failure(error)
    }
  }

  func compactMap<ElementOfResult>(
    _ transform: (Success.Element) -> ElementOfResult?
  ) -> Result<[ElementOfResult], Failure> {
    switch self {
    case .success(let success): return .success(success.compactMap(transform))
    case .failure(let error): return .failure(error)
    }
  }

  func reduce<Reduced>(
    _ initialResult: Reduced,
    _ nextPartialResult: (Reduced, Success.Element) -> Reduced
  ) -> Result<Reduced, Failure> {
    switch self {
    case .success(let success): return .success(success.reduce(initialResult, nextPartialResult))
    case .failure(let error): return .failure(error)
    }
  }

  func reduce<Reduced>(
    into initialResult: Reduced,
    _ updateAccumulatingResult: (inout Reduced, Success.Element) -> ()
  ) -> Result<Reduced, Failure> {
    switch self {
    case .success(let success): return .success(success.reduce(into: initialResult, updateAccumulatingResult))
    case .failure(let error): return .failure(error)
    }
  }
}
