import Foundation

public extension Array {

  /// Attempts to access the element under the `index` index passed in as argument.
  /// If the `index` turns out to be faulty (eg. attempting to access 10th element in 9-element array), then the `nil` is returned.
  ///
  /// - Note: Useful for protecting against the application crash because of out-of-bounds index exception.
  func safeGet(index: Int) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
