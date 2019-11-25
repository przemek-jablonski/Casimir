import QuartzCore

public extension CALayer {
    /**
     Masks all corners (right, left, top, bottom) of a `CALayer` using one radius.

     - Parameter radius: Radius of a corner which will be applied to all corners.

     - Returns: `self` with already masked corners. Useful for chainable operations. Discardable.
     */
    @discardableResult
    func maskAllCorners(by radius: CGFloat? = nil) -> CALayer {
        if let radius = radius { cornerRadius = radius }
        maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner,
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner]
        return self
    }
}
