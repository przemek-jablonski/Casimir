public extension Single {
  /**
   Tests if the return type is `success`.
   */
  var isSuccess: Bool {
    switch self {
    case .success:
      return true
    default:
      return false
    }
  }

  /**
   Tests if the return type is `error`.
   */
  var isError: Bool {
    switch self {
    case .error:
      return true
    default:
      return false
    }
  }
}
