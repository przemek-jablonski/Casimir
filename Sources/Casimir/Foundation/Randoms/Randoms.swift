import Foundation

public extension Double {
    static var random: Double { .random(in: Range.random) }
}

public extension Float {
    static var random: Float { .random(in: Range.random) }
}

public extension Int {
    static var random: Int { .random(in: Range.random) }
}

public extension Bool {
    static var random: Bool { .random() }
}

public extension String {
    static var random: String { LoremIpsum.random }
}

public extension Character {
    static var random: Character { LoremIpsum.random.characters.first! }
}

public extension Range where Bound == Double {
    static var random: Range<Double> { (0.00..<Int.max.double) }
}

public extension Range where Bound == Float {
    static var random: Range<Float> { (0.00..<Int.max.float) }
}

public extension Range where Bound == Int {
    static var random: Range<Int> { (0..<Int.max) }
}

public extension Array where Element == String {
    var random: Element { randomElement() ?? safeGet(index: 0) ?? "" }
}

private let urls = [
    "https://google.com",
    "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
    "https://picsum.photos/id/870/200/300?grayscale&blur=2",
    "https://i.redd.it/vwlgciqshjp41.jpg"
]

public extension URL {
    static var random: URL {
        urls.random.url!
    }
}
