import Foundation
import CoreGraphics

public extension CGRect {
    /**
     Returns the "minimum" point of given rectangle (CGPoint composed of the lowest X and Y values)
     */
    var min: CGPoint {
        CGPoint(x: minX, y: minY)
    }

    /**
     Returns the "maximum" point of given rectangle (CGPoint composed of the highest X and Y values)
     */
    var max: CGPoint {
        CGPoint(x: maxX, y: maxY)
    }

    /**
     Initializes the CGRect using two points, minimum and maximum (lowest and highest X, Y coordinates)
     */
    init(min: CGPoint, max: CGPoint) {
        self.init(x: min.x, y: min.y, width: max.x - min.x, height: max.y - min.y)
    }
}
