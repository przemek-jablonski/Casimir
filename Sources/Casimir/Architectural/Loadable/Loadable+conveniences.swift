public extension Loadable {
  var isLoading: Bool {
    self == .loading ? true : false
  }

  var isLoaded: Bool {
    guard case .loaded = self else { return false }
    return true
  }

  var isNotLoaded: Bool {
    !isLoaded
  }

  var isFailure: Bool {
    guard case .failure = self else { return false }
    return true
  }

  func loaded() -> Model? {
    guard case .loaded(let model) = self else { return nil }
    return model
  }

  func failure() -> Error? {
    guard case .failure(let error) = self else { return nil }
    return error
  }

  enum LoadableError: Error { case isLoadingError }
  func get() throws -> Model {
    switch self {
      case .loaded(let model):
        return model
      case .failure(let error):
        throw error
      case .loading:
        throw LoadableError.isLoadingError
    }
  }
}
