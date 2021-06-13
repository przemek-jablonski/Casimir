import Foundation

public extension Array {
    func safeGet(index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
