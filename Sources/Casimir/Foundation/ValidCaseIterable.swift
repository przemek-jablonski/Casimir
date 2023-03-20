import Foundation

public protocol ValidCaseIterable {
  associatedtype ValidCases: Collection where Self == Self.ValidCases.Element
  static var validCases: Self.ValidCases { get }
}
