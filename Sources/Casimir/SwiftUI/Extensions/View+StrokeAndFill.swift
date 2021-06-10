import SwiftUI

extension View {
    public func strokeAndFill(cornerRadius: CGFloat = 0, fill: Color, stroke: Color, lineWidth: CGFloat) -> some View {
        self
            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(fill))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(stroke, lineWidth: lineWidth))
    }
}
