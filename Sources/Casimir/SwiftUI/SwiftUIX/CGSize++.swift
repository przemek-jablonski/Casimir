//
// Copyright (c) Vatsal Manot
//

import CoreGraphics
import Swift
import SwiftUI

//swiftlint:disable all
public extension CGSize {
    static var greatestFiniteSize: CGSize {
        .init(
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        )
    }
    
    var minimumDimensionLength: CGFloat {
        min(width, height)
    }
    
    var maximumDimensionLength: CGFloat {
        max(width, height)
    }
    
    func dimensionLength(for axis: Axis) -> CGFloat {
        switch axis {
            case .horizontal:
                return width
            case .vertical:
                return height
        }
    }
    
    func anchorPoint(for alignment: Alignment) {
        var result: CGPoint = .zero
        
        switch alignment.horizontal {
            case .leading:
                result.x = 0
            case .center:
                result.x = width / 2
            case .trailing:
                result.x = width
            default:
                break
        }
        
        switch alignment.vertical {
            case .top:
                result.y = 0
            case .center:
                result.y = height / 2
            case .bottom:
                result.y = height
            default:
                break
        }
    }
}

public extension CGSize {
    static func * (lhs: Self, rhs: CGFloat) -> Self {
        .init(
            width: lhs.width * rhs,
            height: lhs.height * rhs
        )
    }
    
    static func *= (lhs: inout Self, rhs: CGFloat) {
        lhs = lhs * rhs
    }
    
    static func / (lhs: Self, rhs: CGFloat) -> Self {
        .init(
            width: lhs.width / rhs,
            height: lhs.height / rhs
        )
    }
    
    static func /= (lhs: inout Self, rhs: CGFloat) {
        lhs = lhs / rhs
    }
}
