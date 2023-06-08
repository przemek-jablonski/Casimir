import Foundation

// swiftlint:disable force_unwrapping
// swiftlint:disable no_magic_numbers

public enum LoremIpsum {}

// swiftlint:disable:next line_length
private let lorem = "Curabitur quis nisl scelerisque, lobortis sapien eu, consequat dolor. Duis ante tortor, tempus ut malesuada a, ullamcorper nec nulla. Suspendisse ultrices nisi ut molestie congue. Integer vulputate diam tortor, vitae aliquam nisl auctor scelerisque. Sed vulputate justo porttitor odio egestas iaculis. In commodo, ex ac commodo facilisis, mauris libero egestas lacus, quis aliquam magna libero id metus. Cras ac nunc lobortis, luctus libero sed, eleifend dui. Curabitur eleifend placerat facilisis. Mauris convallis ante erat, ut ullamcorper leo tempor et. Proin massa enim, lobortis eu justo in, malesuada accumsan dui. In turpis mauris, lacinia nec urna mattis, tincidunt porttitor nisl. Vivamus non iaculis nibh, non tincidunt massa. Sed id malesuada nisi, eu cursus mi. Praesent pharetra varius semper. Morbi lacus diam, sollicitudin sit amet sapien at, ultrices elementum ligula. Sed et est quis est sodales sodales. Praesent eleifend eu nunc vitae elementum. In hac habitasse platea dictumst. Sed a tincidunt elit, vitae laoreet quam. In ut tincidunt augue. Pellentesque venenatis eu justo at aliquet. Aenean nisi ante, dignissim ac cursus sed, ultricies a tellus. Pellentesque elementum tellus vitae felis commodo iaculis. Aliquam tincidunt est at justo condimentum posuere. Etiam et sollicitudin tortor. Cras dui orci, molestie a commodo sit amet, imperdiet et nibh. Nam eu lacus et tortor vestibulum volutpat. Ut dapibus ultrices mauris ut ullamcorper. Donec semper eget ante sit amet lacinia. Cras felis ipsum, elementum eget bibendum sit amet, vulputate ac massa. Sed ornare metus et tellus sagittis volutpat. Nam sodales volutpat elementum. Aenean pulvinar magna leo, eget rhoncus velit dictum sit amet. Etiam fermentum ipsum turpis, sit amet viverra ante dictum bibendum."

extension LoremIpsum {
  private static let full = lorem
  private static let words = LoremIpsum.full.components(separatedBy: " ")
  private static let sentences = LoremIpsum.full.components(separatedBy: ". ")
}

extension LoremIpsum {
  public static var random: String {
    Bool.random() ? LoremIpsum.singleWord : Bool.random() ? LoremIpsum.short : LoremIpsum.regular
  }
}

extension LoremIpsum {
  public static var singleWord: String {
    LoremIpsum
      .words
      .filter({ $0.count > 4 })
      .random()
      .filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) })
      .uppercasedFirst
  }

  public static var short: String {
    (1...3)
      .map({ _ in LoremIpsum.words.random().filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) }) })
      .joined(separator: ", ")
      .uppercasedFirst
  }

  public static var regular: String {
    (4...9)
      .map({ _ in LoremIpsum.words.random().filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) }) })
      .joined(separator: ", ")
      .uppercasedFirst
      + "."
  }

  public static var long: String {
    let random = LoremIpsum.sentences.random()
    if !CharacterSet.letters.contains(random.last!.unicodeScalars.first!) {
      return random.dropLast() + "."
    }
    return random + "."
  }

  public static var extraLong: String {
    (2...3)
      .map({ _ in LoremIpsum.long })
      .joined(separator: " ")
  }

  public static var extraExtraLong: String {
    (3...5)
      .map({ _ in LoremIpsum.long })
      .joined(separator: " ")
  }
}
