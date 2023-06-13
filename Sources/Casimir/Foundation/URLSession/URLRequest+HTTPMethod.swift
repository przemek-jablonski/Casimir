import Foundation

public extension URLRequest {
  enum HTTPMethod {
    case get
    case post
    case put
    case patch
    case delete
    case head
    case connect
    case options
    case trace
    case custom(String)

    internal var rawValue: String {
      switch self {
      case .get: return "GET"
      case .post: return "POST"
      case .put: return "PUT"
      case .patch: return "PATCH"
      case .delete: return "DELETE"
      case .connect: return "CONNECT"
      case .head: return "HEAD"
      case .options: return "OPTIONS"
      case .trace: return "TRACE"
      case .custom(let string): return string
      }
    }
  }
}
