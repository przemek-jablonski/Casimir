// Originally created by Daniel Clelland

import Foundation
import CoreGraphics

public protocol Lerpable {
    func lerp(min: Self, max: Self) -> Self
    func ilerp(min: Self, max: Self) -> Self
}

/**
Calculates the linear interpolation between a minimum and a maximum value.

- parameter weighting: The input weighting. Typically in the range `0...1` but other values are supported.
- parameter min: The minimum value.
- parameter max: The maximum value.

- returns: The weighted average. Typically in the range `min...max` but other values are supported.
*/

public func lerp<T: Lerpable & Comparable>(_ weighting: T, min: T, max: T) -> T {
    weighting.lerp(min: Swift.min(min, max), max: Swift.max(min, max))
}

/**
Calculates the inverse linear interpolation between a minimum and a maximum value.

- parameter value: The input value. Typically in the range `min...max` but other values are supported.
- parameter min: The minimum value.
- parameter max: The maximum value.

- returns: The weighting of *value* between *min* and *max*.
 // Typically in the range `0...1` but other values are supported.
*/

public func ilerp<T: Lerpable & Comparable>(_ value: T, min: T, max: T) -> T {
    value.ilerp(min: Swift.min(min, max), max: Swift.max(min, max))
}

extension Double: Lerpable {
    public func lerp(min: Double, max: Double) -> Double {
        min + (self * (max - min))
    }
    public func ilerp(min: Double, max: Double) -> Double {
        ((self - min) / (max - min)).clamp(min: 0.00, max: 1.00)
    }
}

extension Float: Lerpable {
    public func lerp(min: Float, max: Float) -> Float {
        min + (self * (max - min))
    }
    public func ilerp(min: Float, max: Float) -> Float {
        ((self - min) / (max - min)).clamp(min: 0.00, max: 1.00)
    }
}

extension CGFloat: Lerpable {
    public func lerp(min: CGFloat, max: CGFloat) -> CGFloat {
        min + (self * (max - min))
    }
    public func ilerp(min: CGFloat, max: CGFloat) -> CGFloat {
        ((self - min) / (max - min)).clamp(min: 0.00, max: 1.00)
    }
}

// swiftlint:disable identifier_name
extension CGPoint: Lerpable {
    public func lerp(min: CGPoint, max: CGPoint) -> CGPoint {
        let x = self.x.lerp(min: min.x, max: max.x)
        let y = self.y.lerp(min: min.y, max: max.y)
        return CGPoint(x: x, y: y)
    }
    public func ilerp(min: CGPoint, max: CGPoint) -> CGPoint {
        let x = self.x.ilerp(min: min.x, max: max.x).clamp(min: 0.00, max: 1.00)
        let y = self.y.ilerp(min: min.y, max: max.y).clamp(min: 0.00, max: 1.00)
        return CGPoint(x: x, y: y)
    }
}
// swiftlint:enable identifier_name

public extension CGPoint {
    func lerp(rect: CGRect) -> CGPoint {
        lerp(min: rect.min, max: rect.max)
    }
    func ilerp(rect: CGRect) -> CGPoint {
        ilerp(min: rect.min, max: rect.max)
    }
}

public extension CGRect {
    func lerp(rect: CGRect) -> CGRect {
        let min = self.min.lerp(min: rect.min, max: rect.max)
        let max = self.max.lerp(min: rect.min, max: rect.max)
        return CGRect(min: min, max: max)
    }
    func ilerp(rect: CGRect) -> CGRect {
        let min = self.min.ilerp(min: rect.min, max: rect.max)
        let max = self.max.ilerp(min: rect.min, max: rect.max)
        return CGRect(min: min, max: max)
    }
}
