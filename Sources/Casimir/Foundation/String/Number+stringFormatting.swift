import CoreGraphics

public extension Int {
    func string(leadingZeroes: Int) -> String {
        String(format: "%0\(leadingZeroes)d", self)
    }
}

public extension Double {
    func string(decimalPlaces: Int) -> String {
        String(format: "%.\(decimalPlaces)f", self)
    }
}

public extension Float {
    func string(decimalPlaces: Int) -> String {
        String(format: "%.\(decimalPlaces)f", self)
    }
}

public extension CGFloat {
    func string(decimalPlaces: Int) -> String {
        String(format: "%.\(decimalPlaces)f", self)
    }
}
