import Foundation

public extension String {
  /**
   Performs capitalization only on a first letter of a String.
   */
  var capitalizedFirstLetter: String {
    prefix(1).capitalized + dropFirst()
  }
}
