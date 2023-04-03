import Foundation

// TODO: refine all of this

extension Result where Success == URLRequest, Failure == URLRequest.ConstructionError {
  internal func logRequest() -> Result {
    #if DEBUG
    return onEvent { request in
      switch request {
      case .failure(let error):
        debugPrint(error)
      case .success(let request):
        debugPrint(request)
      }
    }
    #else
    return self
    #endif
  }
}

extension Result where Success == URLSession.DataTaskHTTPResponse, Failure == URLSession.DataTaskHTTPError {
  internal func logResponse() -> Result {
    #if DEBUG
    return onEvent { request in
      switch request {
      case .failure(let error):
        debugPrint(error)
      case .success(let response):
        debugPrint(response)
      }
    }
    #else
    return self
    #endif
  }
}

public extension Result {
  func logIfDecodingFails(of data: Data) -> Result {
    #if DEBUG
    return onFailure { error in
      print(data.prettyPrinted)
      debugPrint(error)
    }
    #else
    return self
    #endif
  }
}
