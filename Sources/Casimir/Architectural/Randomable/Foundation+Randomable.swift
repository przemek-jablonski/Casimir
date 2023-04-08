import Foundation

// TODO: search for all "random" properties and get them together here

extension Double: Randomable {
  public static var random: Self { .random(in: Int.min.double...Int.max.double) }
}

extension Float: Randomable {
  public static var random: Self { .random(in: Int.min.float...Int.max.float) }
}

extension Int: Randomable {
  public static var random: Self { .random(in: .min...max) }
}

extension Bool: Randomable {
  public static var random: Self { .random() }
}

extension String: Randomable {
  public static var random: Self { LoremIpsum.random }
}

extension Character: Randomable {
  public static var random: Self { LoremIpsum.random.characters.first ?? "a" }
}

extension Range: Randomable where Bound: Randomable {
  public static var random: Self {
    let boundsA = Bound.random
    let boundsB = Bound.random
    return (Swift.min(boundsA, boundsB) ..< Swift.max(boundsA, boundsB))
  }
}

extension Dictionary: Randomable where Key: Randomable, Value: Randomable {
  public static var random: Self {
    Dictionary(uniqueKeysWithValues: zip(Key.randoms.removingDuplicates(), Value.randoms))
  }
}

// TODO: Implement Set+randoms

// public extension Range: where Bound == Double {
//  static var random: Range<Double> { (0.00..<Int.max.double) }
// }
//
// public extension Range where Bound == Float {
//  static var random: Range<Float> { (0.00..<Int.max.float) }
// }
//
// public extension Range where Bound == Int {
//  static var random: Range<Int> { (0..<Int.max) }
// }

// TODO: Implement Array + randoms
extension Array: Randomable where Element: Randomable {
  //
}

// public extension Array where Element == String {
//  public var random: Element { randomElement() ?? safeGet(index: 0) ?? "" }
// }

extension URL: Randomable {
  public static var random: Self {
    URL(
      string: [
        "https://google.com",
        "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
        "https://picsum.photos/id/870/200/300?grayscale&blur=2",
        "https://i.redd.it/vwlgciqshjp41.jpg",
        "https://en.wikipedia.org/wiki/Lorem_ipsum"
      ]
      .random
      // swiftlint:disable:next force_unwrapping
    )!
  }
}
