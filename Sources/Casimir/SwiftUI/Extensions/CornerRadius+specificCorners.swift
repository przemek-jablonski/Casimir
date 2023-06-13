#if canImport(UIKit)
import SwiftUI
import UIKit

public extension View {
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(RoundedCornersShape(radius: radius, corners: corners) )
  }
}

public struct RoundedCornersShape: Shape {
  internal var radius: CGFloat = .infinity
  internal var corners: UIRectCorner = .allCorners

  public func path(in rect: CGRect) -> Path {
    Path(
      UIBezierPath(
        roundedRect: rect,
        byRoundingCorners: corners,
        cornerRadii: CGSize(
          width: radius,
          height: radius
        )
      )
      .cgPath
    )
  }
}
#endif
