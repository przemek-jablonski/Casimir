import SwiftUI

public extension View {
  func strokeAndFill(cornerRadius: CGFloat = 0, fill: Color, stroke: Color, lineWidth: CGFloat) -> some View {
    self.background(RoundedRectangle(cornerRadius: cornerRadius).fill(fill))
      .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(stroke, lineWidth: lineWidth))
  }
}

//public extension Shape {
//  func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(
//    _ fillStyle: Fill,
//    strokeBorder strokeStyle: Stroke,
//    lineWidth: Double = 1
//  ) -> some View {
//    self
//      .stroke(strokeStyle, lineWidth: lineWidth)
//      .background(self.fill(fillStyle))
//  }
//}
//
//public extension InsettableShape {
//  func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(
//    _ fillStyle: Fill,
//    strokeBorder strokeStyle: Stroke,
//    lineWidth: Double = 1
//  ) -> some View {
//    self
//      .strokeBorder(strokeStyle, lineWidth: lineWidth)
//      .background(self.fill(fillStyle))
//  }
//}
