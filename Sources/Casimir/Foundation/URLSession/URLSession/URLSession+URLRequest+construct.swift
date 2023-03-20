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

public extension URLSession {
  /**
   Performs a HTTP network request to given `url`, after attempting to construct the request with given function arguments.
   */
  func perform(
    requestTo url: String,
    using httpMethod: URLRequest.HTTPMethod,
    headers: [String: String] = [:],
    queryItems: [String: String]  = [:],
    encoding body: Encodable? = nil,
    using jsonEncoder: JSONEncoder
  ) async -> Result<DataTaskHTTPResponse, HTTPNetworkRequestError> {
    await URLRequest.construct(
      requestTo: url,
      using: httpMethod,
      headers: headers,
      queryItems: queryItems,
      encoding: body,
      using: jsonEncoder
    )
    .mapError(HTTPNetworkRequestError.requestConstructionError)
    .flatMap { urlRequest in
      await self.data(urlRequest)
        .mapError(HTTPNetworkRequestError.httpError)
    }
  }

  /**
   Performs a HTTP network request `url`, after attempting to construct the request with given function arguments.
   */
  func perform(
    requestTo url: String,
    using httpMethod: URLRequest.HTTPMethod,
    headers: [String: String] = [:],
    queryItems: [String: String] = [:],
    body: Data? = nil
  ) async -> Result<DataTaskHTTPResponse, HTTPNetworkRequestError> {
    await URLRequest.construct(
      requestTo: url,
      using: httpMethod,
      headers: headers,
      queryItems: queryItems,
      body: body
    )
    .mapError(HTTPNetworkRequestError.requestConstructionError)
    .flatMap { urlRequest in
      await self.data(urlRequest)
        .mapError(HTTPNetworkRequestError.httpError)
    }
  }
}
