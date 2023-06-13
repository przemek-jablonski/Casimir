import Foundation

// swiftlint:disable discouraged_optional_collection
public extension URLComponents {
  /**
   Convenience initializer where URL components can be expressed inline, as init arguments.

   - Note: If configuration of `url` and `queryItems` is conflicting with values passed in `port`, `scheme`, `user` or `password`
   then the latter parameters are taking precedence.
   */
  init?(
    url: String,
    queryItems: [String: String]? = nil,
    port: Int? = nil,
    scheme: String? = nil,
    user: String? = nil,
    password: String? = nil
  ) {
    self.init(string: url)
    if let queryItems, !queryItems.isEmpty {
      self.queryItems = queryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    if let port { self.port = port }
    if let scheme { self.scheme = scheme }
    if let user { self.user = user }
    if let password { self.password = password }
  }
}
// swiftlint:enable discouraged_optional_collection
