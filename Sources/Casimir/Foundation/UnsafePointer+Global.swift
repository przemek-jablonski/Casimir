import Foundation

public func unsafePointer<T: Any>(of object: T) -> UnsafePointer<T> {
  withUnsafePointer(to: object) { $0 }
}
