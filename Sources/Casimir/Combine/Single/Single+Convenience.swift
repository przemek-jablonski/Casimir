extension Single {
  public var isSuccess: Bool {
    switch self {
    case .success:
      return true
    default:
      return false
    }
  }

  public var isError: Bool {
    switch self {
    case .error:
      return true
    default:
      return false
    }
  }
}
