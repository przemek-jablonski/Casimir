import SwiftUI

/**
 Container View, which will try to enforce it's contents to have (almost) the same size as `GeometryProxy`.
 */
public struct FullScreenView<Content: View>: View {

  var geometry: GeometryProxy
  let content: () -> Content
  let heightMultiplier: CGFloat

  public init(basedOn geometry: GeometryProxy,
              heightMultiplier: Float = 0.90,
              _ content: @escaping () -> Content) {
    self.geometry = geometry
    self.content = content
    self.heightMultiplier = CGFloat(heightMultiplier)
  }

  public var body: some View {
    content()
      .frame(minHeight: geometry.size.height * heightMultiplier, alignment: .center)
      .padding()
  }
}
