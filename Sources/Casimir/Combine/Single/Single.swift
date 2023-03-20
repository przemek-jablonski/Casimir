public enum Single<Content, Error: Swift.Error> {
  case success(content: Content)
  case error(error: Error)
}
