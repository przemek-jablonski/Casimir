import Foundation

internal class TestIncrementingRandomNumberGenerator {
  private var startingNumber: UInt64

  internal init(
    startingWith startingNumber: UInt64
  ) {
    self.startingNumber = startingNumber
  }
}

internal func withTestIncrementingRandomNumberGenerator(
  startingWith startingNumber: UInt64 = 0.uInt64,
  perform: ( _ randomNumberGenerator: inout RandomNumberGenerator) -> ()
) {
  var testRandomNumberGenerator: RandomNumberGenerator = TestIncrementingRandomNumberGenerator(startingWith: startingNumber)
  perform(&testRandomNumberGenerator)
}

extension TestIncrementingRandomNumberGenerator: RandomNumberGenerator {
  func next() -> UInt64 {
    let number = startingNumber
    self.startingNumber += 1
    return number
  }
}
