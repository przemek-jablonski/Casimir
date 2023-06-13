import Foundation

public extension URLRequest {
  /**
   Possible ways in which creating a `URLRequest` using static `construct(...)` call can fail.
   */
  enum ConstructionError: Error {
    case constructingURLComponentsWithQueryItemsFailure(url: String, queryItems: [String: String])
    case extractingURLFromURLComponentsFailure(url: String, queryItems: [String: String])
    case encodingRequestBodyFailure(error: Error)
  }
}

// swiftlint:disable discouraged_optional_collection
public extension URLRequest {
  /**
   Constructs the `URLRequest` with given parameters or fails with typed `URLRequestConstructionError`.
   */
  static func construct(
    requestTo url: String,
    using httpMethod: HTTPMethod,
    headers: [String: String]? = nil,
    queryItems: [String: String]? = nil,
    encoding body: Encodable? = nil,
    using jsonEncoder: JSONEncoder
  ) -> Result<URLRequest, ConstructionError> {
    Result { try body?.data(using: jsonEncoder) }
      .mapError(ConstructionError.encodingRequestBodyFailure(error: ))
      .flatMap { data in
        construct(
          requestTo: url,
          using: httpMethod,
          headers: headers,
          queryItems: queryItems,
          body: data
        )
      }
  }

  // TODO: TEST THIS
  // [:] should become nil
  /**
   Constructs the `URLRequest` with given parameters or fails with typed `URLRequestConstructionError`.
   */
  static func construct(
    requestTo url: String,
    using httpMethod: HTTPMethod,
    headers: [String: String]? = nil,
    queryItems: [String: String]? = nil,
    body: Data? = nil
  ) -> Result<URLRequest, ConstructionError> {

    guard let urlComponents = URLComponents(url: url, queryItems: queryItems) else {
      return .failure(
        .constructingURLComponentsWithQueryItemsFailure(
          url: url,
          queryItems: queryItems ?? [:]
        )
      )
    }

    guard let url = urlComponents.url else {
      return .failure(
        .extractingURLFromURLComponentsFailure(
          url: url,
          queryItems: queryItems ?? [:]
        )
      )
    }

    var request = URLRequest(url: url)
    request.httpMethod = httpMethod.rawValue

    headers?
      .compactMap { $0 }
      .forEach {
        request.addValue(
          $0.value,
          forHTTPHeaderField: $0.key
        )
      }

    return .success(request)
  }
}
// swiftlint:enable discouraged_optional_collection

private extension Encodable {
  func data(using jsonEncoder: JSONEncoder = JSONEncoder()) throws -> Data {
    try jsonEncoder.encode(self)
  }
}
