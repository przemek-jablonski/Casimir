import QuartzCore

public extension CALayer {
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
