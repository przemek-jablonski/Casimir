//  Originally Created by Daniel Clelland

import Foundation
import CoreGraphics

public protocol Clampable {
    func clamp(min: Self, max: Self) -> Self
}

/**
Clamps the value between an lower and upper bound.

- parameter value: The input value.
- parameter min: The lower bound.
- parameter max: The upper bound.

- returns: Returns *min* if *value* is less than min, or *max* otherwise. *min* and *max* can safely be swapped.
*/

public func clamp<T: Clampable>(_ value: T, min: T, max: T) -> T {
    value.clamp(min: min, max: max)
}

extension Int: Clampable {
    public func clamp(min: Self, max: Self) -> Self {
        Swift.min(Swift.max(self, Swift.min(min, max)), Swift.max(min, max))
    }
}

extension Double: Clampable {
    public func clamp(min: Self, max: Self) -> Self {
        Swift.min(Swift.max(self, Swift.min(min, max)), Swift.max(min, max))
    }
}

extension Float: Clampable {
    public func clamp(min: Self, max: Self) -> Self {
        Swift.min(Swift.max(self, Swift.min(min, max)), Swift.max(min, max))
    }
}

extension CGFloat: Clampable {
    public func clamp(min: Self, max: Self) -> Self {
        Swift.min(Swift.max(self, Swift.min(min, max)), Swift.max(min, max))
    }
}

extension CGPoint: Clampable {
    public func clamp(min: Self, max: Self) -> Self {
        let x = self.x.clamp(min: min.x, max: max.x)
        let y = self.y.clamp(min: min.y, max: max.y)
        return CGPoint(x: x, y: y)
    }
}

public extension CGPoint {
    func clamp(rect: CGRect) -> CGPoint {
        clamp(min: rect.min, max: rect.max)
    }
}
