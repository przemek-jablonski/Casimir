import Foundation

public extension URLSession {
  /**
   Possible ways in which fetching `Data` using `URLSessionDataTask` can fail.
   */
  enum DataTaskHTTPError: Error {
    case serverRequestConstructionFailed(Error?)
    case serverReturnedNonHTTPContent
    case serverReturnedInvalidStatusCode(code: Int)
    case internalNetworkClientFailure(Error)
  }
}

public extension URLSession {
  typealias DataTaskResponse = (
    response: Data,
    request: URLRequest,
    metadata: URLResponse
  )

  typealias DataTaskHTTPResponse = (
    response: Data,
    request: URLRequest,
    metadata: HTTPURLResponse
  )

  /**
   Convenience method for async loading of `Data` using `URLSessionDataTask`.
   Returns `Result` type with typed error of type `DataTaskHTTPError`.
   */
  func data(
    _ urlRequest: URLRequest
  ) async -> Result<DataTaskHTTPResponse, DataTaskHTTPError> {
    return await Result { try await self.data(for: urlRequest) }
      .map { (data, urlResponse) in (data, urlRequest, urlResponse) }
      .mapError { DataTaskHTTPError.internalNetworkClientFailure($0) }
      .processHTTPResponse()
      .logResponse()
  }
}

private extension Result<URLSession.DataTaskResponse, URLSession.DataTaskHTTPError> {
  func processHTTPResponse() -> Result<URLSession.DataTaskHTTPResponse, URLSession.DataTaskHTTPError> {
    self.flatMap { (response: Data, request: URLRequest, metadata: URLResponse) in
      guard let metadata = metadata as? HTTPURLResponse else {
        return .failure(.serverReturnedNonHTTPContent)
      }

      guard (200..<300) ~= metadata.statusCode else {
        return .failure(.serverReturnedInvalidStatusCode(code: metadata.statusCode))
      }

      return .success((response, request, metadata))
    }
  }
}
