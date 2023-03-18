import Foundation

// MARK: - Catching

public extension Result {
  /**
   Creates a new `Result` by evaluating an `async` throwing closure, capturing the returned value as a `Success`, or any thrown error as a `Failure`.
   */
  init(
    catching body: () async throws -> Success
  ) async where Failure == Error {
    do {
      self = .success(try await body())
    } catch {
      self = .failure(error)
    }
  }
}

// MARK: - Map

public extension Result {
  /**
   Returns a new `Result`, mapping any success value using the given `async` transformation.
   */
  func map<NewSuccess>(
    _ transform: (Success) async -> NewSuccess
  ) async -> Result<NewSuccess, Failure> {
    switch self {
      case .success(let success): return await .success(transform(success))
      case .failure(let error): return .failure(error)
    }
  }
  
  /**
   Returns a new `Result`, mapping any failure using the given `async` transformation.
   */
  func mapError<NewFailure: Error>(
    _ transform: (Failure) async -> NewFailure
  ) async -> Result<Success, NewFailure> {
    switch self {
      case .success(let success): return .success(success)
      case .failure(let error): return await .failure(transform(error))
    }
  }
}

// MARK: - FlatMap

public extension Result {
  /**
   Returns a new `Result`, mapping any success value using the given `async` transformation and unwrapping the produced result.
  */
  func flatMap<NewSuccess>(
    _ transform: (Success) async -> Result<NewSuccess, Failure>
  ) async -> Result<NewSuccess, Failure> {
    switch self {
      case .success(let success): return await transform(success)
      case .failure(let error): return .failure(error)
    }
  }
  
  /**
   Returns a new `Result`, mapping any failure value using the given `async` transformation and unwrapping the produced result.
   */
  func flatMapError<NewFailure>(
    _ transform: (Failure) async -> Result<Success, NewFailure>
  ) async -> Result<Success, NewFailure> {
    switch self {
      case .success(let success): return .success(success)
      case .failure(let error): return await transform(error)
    }
  }
}
