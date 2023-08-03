import Foundation

public extension URLSession {
  /**
   Possible ways in which constructing and performing network request can fail.
   */
  enum HTTPNetworkRequestError: Error {
    case requestConstructionError(URLRequest.ConstructionError)
    case httpError(URLSession.DataTaskHTTPError)
  }
}

// TODO: Logging should be configurable
public extension URLSession {
  /**
   Performs a HTTP network request to given `url`, after attempting to construct the request with given function arguments.
   */
  func perform(
    requestTo url: String,
    using httpMethod: String,
    headers: [String: String] = [:],
    queryItems: [String: String]  = [:],
    encoding body: Encodable? = nil,
    using jsonEncoder: JSONEncoder
  ) async -> Result<DataTaskHTTPResponse, HTTPNetworkRequestError> {
    await perform(
      request:
        URLRequest.construct(
          requestTo: url,
          using: httpMethod,
          headers: headers,
          queryItems: queryItems,
          encoding: body,
          using: jsonEncoder
        )
    )
  }

  /**
   Performs a HTTP network request `url`, after attempting to construct the request with given function arguments.
   */
  func perform(
    requestTo url: String,
    using httpMethod: String,
    headers: [String: String] = [:],
    queryItems: [String: String] = [:],
    body: Data? = nil
  ) async -> Result<DataTaskHTTPResponse, HTTPNetworkRequestError> {
    await perform(
      request:
        URLRequest.construct(
          requestTo: url,
          using: httpMethod,
          headers: headers,
          queryItems: queryItems,
          body: body
        )
    )
  }
}

private extension URLSession {
  func perform(
    request: Result<URLRequest, URLRequest.ConstructionError>
  ) async -> Result<DataTaskHTTPResponse, HTTPNetworkRequestError> {
    await request
      //      .logRequest()
      .mapError(HTTPNetworkRequestError.requestConstructionError)
      .flatMap { urlRequest in
        await self.data(urlRequest)
          //          .logResponse()
          .mapError(HTTPNetworkRequestError.httpError)
      }
  }
}
