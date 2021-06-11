//
//  Lerp.swift
//  Lerp
//
//  Created by Daniel Clelland on 6/12/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import Foundation
import CoreGraphics


// MARK: Lerpable protocol

public protocol Lerpable {
    func lerp(min: Self, max: Self) -> Self
    func ilerp(min: Self, max: Self) -> Self
}

// MARK: Lerpable global functions

/**
Calculates the linear interpolation between a minimum and a maximum value.

- parameter weighting: The input weighting. Typically in the range `0...1` but other values are supported.
- parameter min: The minimum value.
- parameter max: The maximum value.

- returns: The weighted average. Typically in the range `min...max` but other values are supported.
*/

public func lerp<T: Lerpable>(_ weighting: T, min: T, max: T) -> T {
    return weighting.lerp(min: min, max: max)
}

/**
Calculates the inverse linear interpolation between a minimum and a maximum value.

- parameter value: The input value. Typically in the range `min...max` but other values are supported.
- parameter min: The minimum value.
- parameter max: The maximum value.

- returns: The weighting of *value* between *min* and *max*.
 // Typically in the range `0...1` but other values are supported.
*/

public func ilerp<T: Lerpable>(_ value: T, min: T, max: T) -> T {
    return value.ilerp(min: min, max: max)
}

// MARK: Lerpable implementations

extension Double: Lerpable {
    
    /// Linear interpolation
    public func lerp(min: Double, max: Double) -> Double {
        return min + (self * (max - min))
    }
    
    /// Inverse linear interpolation
    public func ilerp(min: Double, max: Double) -> Double {
        return (self - min) / (max - min)
    }
    
}

extension Float: Lerpable {
    
    /// Linear interpolation
    public func lerp(min: Float, max: Float) -> Float {
        return min + (self * (max - min))
    }
    
    /// Inverse linear interpolation
    public func ilerp(min: Float, max: Float) -> Float {
        return (self - min) / (max - min)
    }
    
}

extension CGFloat: Lerpable {
    
    /// Linear interpolation
    public func lerp(min: CGFloat, max: CGFloat) -> CGFloat {
        return min + (self * (max - min))
    }
    
    /// Inverse linear interpolation
    public func ilerp(min: CGFloat, max: CGFloat) -> CGFloat {
        return (self - min) / (max - min)
    }
    
}

extension CGPoint: Lerpable {
    
    /// Linear interpolation
    public func lerp(min: CGPoint, max: CGPoint) -> CGPoint {
        let x = self.x.lerp(min: min.x, max: max.x)
        let y = self.y.lerp(min: min.y, max: max.y)
        return CGPoint(x: x, y: y)
    }
    
    /// Inverse linear interpolation
    public func ilerp(min: CGPoint, max: CGPoint) -> CGPoint {
        let x = self.x.ilerp(min: min.x, max: max.x)
        let y = self.y.ilerp(min: min.y, max: max.y)
        return CGPoint(x: x, y: y)
    }

}

// MARK: CGPoint lerpable extension

extension CGPoint {
    
    /// Linear interpolation on a rect
    public func lerp(rect: CGRect) -> CGPoint {
        return lerp(min: rect.min, max: rect.max)
    }
    
    /// Inverse linear interpolation on a rect
    public func ilerp(rect: CGRect) -> CGPoint {
        return ilerp(min: rect.min, max: rect.max)
    }

}

// MARK: CGRect lerpable extension

extension CGRect {
    /// Linear interpolation on a rect
    public func lerp(rect: CGRect) -> CGRect {
        let min = self.min.lerp(min: rect.min, max: rect.max)
        let max = self.max.lerp(min: rect.min, max: rect.max)
        return CGRect(min: min, max: max)
    }
    
    /// Inverse linear interpolation on a rect
    public func ilerp(rect: CGRect) -> CGRect {
        let min = self.min.ilerp(min: rect.min, max: rect.max)
        let max = self.max.ilerp(min: rect.min, max: rect.max)
        return CGRect(min: min, max: max)
    }
}
