import Foundation

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
    self.init(
      url: url,
      queryItems: queryItems?.map { URLQueryItem(name: $0.key, value: $0.value) },
      port: port,
      scheme: scheme,
      user: user,
      password: password
    )
  }

  /**
   Convenience initializer where URL components can be expressed inline, as init arguments.

   - Note: If configuration of `url` and `queryItems` is conflicting with values passed in `port`, `scheme`, `user` or `password`
   then the latter parameters are taking precedence.
   */
  init?(
    url: String,
    queryItems: [URLQueryItem]? = nil,
    port: Int? = nil,
    scheme: String? = nil,
    user: String? = nil,
    password: String? = nil
  ) {
    self.init(string: url)
    self.queryItems = queryItems
    self.port = port
    self.scheme = scheme
    self.user = user
    self.password = password
  }
}
