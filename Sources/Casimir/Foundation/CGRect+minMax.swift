//
//  CGRect+minMax.swift
//  CGRect+minMax
//
//  Created by Daniel Clelland on 6/12/15.
//  Copyright © 2015 Daniel Clelland. All rights reserved.
//

import Foundation
import CoreGraphics

//swiftlint:disable identifier_name
public extension CGRect {
    var min: CGPoint {
        return CGPoint(x: minX, y: minY)
    }
    
    var max: CGPoint {
        return CGPoint(x: maxX, y: maxY)
    }
    
    init(min: CGPoint, max: CGPoint) {
        self.init(x: min.x, y: min.y, width: max.x - min.x, height: max.y - min.y)
    }
}
