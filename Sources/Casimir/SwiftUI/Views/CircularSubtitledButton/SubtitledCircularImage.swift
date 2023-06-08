import SwiftUI

/**
 Compound View which consists of `Image` on a circular background and a single `Text` underneath,
 laid out vertically one under another.
 */
@available(macOS, introduced: 11.0, message: "uses SFSymbols (systemName), available on 11.0+")
@available(macCatalyst, introduced: 14.0)
@available(iOS, introduced: 14.0)
@available(watchOS, introduced: 7.0)
@available(tvOS, introduced: 14.0)
public struct SubtitledCircularImage<TextView: View>: View {
  public let systemName: String
  public let text: () -> TextView
  public let circleColor: Color
  public let iconColor: Color

  public var body: some View {
    VStack {
      GeometryReader { geometry in
        ZStack(alignment: .center) {
          Circle()
            .foregroundColor(self.circleColor)
          Image(systemName: systemName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: geometry.size.width / 2,
                   height: geometry.size.height / 2,
                   alignment: .center)
            .foregroundColor(self.iconColor)
        }
      }
      self.text()
        .multilineTextAlignment(.center)
        .padding(.top)
    }
  }
}

@available(macOS, introduced: 11.0, message: "uses SFSymbols (systemName), available on 11.0+")
@available(macCatalyst, introduced: 14.0)
@available(iOS, introduced: 14.0)
@available(watchOS, introduced: 7.0)
@available(tvOS, introduced: 14.0)
struct SwiftUIPreviewSubtitledCircularImage: PreviewProvider {
  static var previews: some View {
    Group {
      SubtitledCircularImage(systemName: "bolt",
                             text: { Text(LoremIpsum.short) },
                             circleColor: .black,
                             iconColor: .black)
        .previewDevice(.applewatch_large)

      SubtitledCircularImage(systemName: "bolt",
                             text: { Text(LoremIpsum.short) },
                             circleColor: .clear,
                             iconColor: .blue)
        .previewDevice(.applewatch_small)

      SubtitledCircularImage(systemName: "bolt",
                             text: { Text(LoremIpsum.short) },
                             circleColor: .red,
                             iconColor: .white)
        .previewDevice(.applewatch_small)
    }
  }
}
