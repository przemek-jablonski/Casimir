/**
 Signifies ability to quickly generate random/mock instances of given class for realtime mocking.
 */
public protocol Randomable {
    static var random: Self { get }
    static var randoms: [Self] { get }
}

public extension Randomable {
    static var randoms: [Self] {
        (2..<6).map({ _ in .random })
    }
}
