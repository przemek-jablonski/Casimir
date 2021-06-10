import Foundation

public extension TimeZone {
    init() {
        self.init(secondsFromGMT: 0)!
    }

    static var gmt0: TimeZone {
        TimeZone(secondsFromGMT: 0)!
    }
}
