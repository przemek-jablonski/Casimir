/**
 Signals that given type is capable of statically producing an example of value which is considered "invalid" in it's environment.
 */
public protocol Invalid {
  static var invalid: Self { get }
}
