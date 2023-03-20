public enum Completable<Error: Swift.Error> {
  case completed
  case error(error: Error)
}
