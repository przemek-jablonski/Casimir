public enum LoadableData<Data: ModelProtocol, Error: ErrorProtocol> {
  case loading
  case loaded(data: Data)
  case failure(error: Error)
}
