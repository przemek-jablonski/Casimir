//
//  Clamp.swift
//  Clamp
//
//  Created by Daniel Clelland on 6/12/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import Foundation
import CoreGraphics

//swiftlint:disable identifier_name


// MARK: Clampable protocol

public protocol Clampable {
    func clamp(min: Self, max: Self) -> Self
}

// MARK: Clampable global functions

/**
Clamps the value between an lower and upper bound.

- parameter value: The input value.
- parameter min: The lower bound.
- parameter max: The upper bound.

- returns: Returns *min* if *value* is less than min, or *max* otherwise. *min* and *max* can safely be swapped.
*/

public func clamp<T: Clampable>(_ value: T, min: T, max: T) -> T {
    return value.clamp(min: min, max: max)
}

// MARK: Clampable implementations

extension Double: Clampable {
    
    /// Clamp
    public func clamp(min: Double, max: Double) -> Double {
        return Swift.min(Swift.max(self, Swift.min(min, max)), Swift.max(min, max))
    }
    
}

extension Float: Clampable {
    
    /// Clamp
    public func clamp(min: Float, max: Float) -> Float {
        return Swift.min(Swift.max(self, Swift.min(min, max)), Swift.max(min, max))
    }
    
}

extension CGFloat: Clampable {
    
    /// Clamp
    public func clamp(min: CGFloat, max: CGFloat) -> CGFloat {
        return Swift.min(Swift.max(self, Swift.min(min, max)), Swift.max(min, max))
    }
    
}

extension CGPoint: Clampable {
    
    /// Clamp
    public func clamp(min: CGPoint, max: CGPoint) -> CGPoint {
        let x = self.x.clamp(min: min.x, max: max.x)
        let y = self.y.clamp(min: min.y, max: max.y)
        return CGPoint(x: x, y: y)
    }
    
}

// MARK: CGPoint clampable extension

public extension CGPoint {
    /// Clamp to a rect
    func clamp(rect: CGRect) -> CGPoint {
        return clamp(min: rect.min, max: rect.max)
    }
}
