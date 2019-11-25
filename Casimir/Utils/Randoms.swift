import Foundation

//TODO: should be moved to the test target
private let randomStringAlphanumericSamplingList = "abcdefghijklmnopqrstuvwxyz0123456789"
private let randomStringNumbersSamplingList = "0123456789"

public func randomString(forLength length: Int = 16, usingNumbersOnly: Bool = false) -> String {
    let sample = usingNumbersOnly ? randomStringNumbersSamplingList : randomStringAlphanumericSamplingList
    return String((0..<length).map { _ in sample.randomElement()! })
}

public func random() -> String {
    return randomString()
}

public func random() -> Int {
    return Int.random(in: 100...999)
}

public func random() -> Double {
    return Double.random(in: 100...999)
}
