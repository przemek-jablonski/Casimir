import Foundation

public extension String {
  var uppercasedFirst: String {
    prefix(1).capitalized + dropFirst()
  }
}
