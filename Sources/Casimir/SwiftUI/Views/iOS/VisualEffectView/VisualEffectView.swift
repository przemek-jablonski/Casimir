#if canImport(UIKit) 
import SwiftUI
import UIKit

public struct VisualEffectView: UIViewRepresentable {
    public var effect: Effect

    public init(effect: Effect) {
        self.effect = effect
    }

    public func makeUIView(
        context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }

    public func updateUIView(
        _ uiView: UIVisualEffectView,
        context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect.asUIKitComponent
    }
}

extension VisualEffectView {
    public enum Effect {
        case blur(style: BlurStyle)
        case vibrancy(blur: BlurStyle, vibrancy: VibrancyStyle)
        case none
    }

    public enum BlurStyle {
        case regular
        case prominent
        case light
        case systemRegular
        case systemThin
        case systemThick
        case systemChrome
    }

    public enum VibrancyStyle {
        case fill
        case label
        case secondaryFill
        case secondaryLabel
        case separator
    }
}

extension VisualEffectView.Effect {
    var asUIKitComponent: UIVisualEffect? {
        switch self {
        case .blur(let style):
            return style.asUIKitComponent.effect
        case .vibrancy(let blur, let vibrancy):
            return UIVibrancyEffect(
                blurEffect: blur.asUIKitComponent.effect,
                style: vibrancy.asUIKitComponent)
        case .none:
            return nil
        }
    }
}

extension VisualEffectView.BlurStyle {
    var asUIKitComponent: UIBlurEffect.Style {
        switch self {
        case .regular:
            return .regular
        case .prominent:
            return .prominent
        case .light:
            return .light
        case .systemRegular:
            return .regular
        case .systemThin:
            return .systemThinMaterial
        case .systemThick:
            return .systemThickMaterial
        case .systemChrome:
            return .systemChromeMaterial
        }
    }
}

extension VisualEffectView.VibrancyStyle {
    var asUIKitComponent: UIVibrancyEffectStyle {
        switch self {
        case .fill:
            return .fill
        case .label:
            return .label
        case .secondaryFill:
            return .secondaryFill
        case .secondaryLabel:
            return .secondaryLabel
        case .separator:
            return .separator
        }
    }
}

private extension UIBlurEffect.Style {
    var effect: UIBlurEffect {
        UIBlurEffect(style: self)
    }
}

struct SwiftUIPreviewVisualEffectView: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                mockGrid
            }
            .frame(width: 256, height: 256)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Background")

            ZStack {
                mockGrid
                VisualEffectView(effect: .blur(style: .light))
                VStack {
                    Image(systemName: ".infoCircle")
                    Text("SFSymbol.infoCircle")
                }
            }
            .frame(width: 256, height: 256)
            .previewLayout(.sizeThatFits)
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Blur (light) + light mode")

            ZStack {
                mockGrid
                VisualEffectView(effect: .blur(style: .light))
                VStack {
                    Image(systemName: ".infoCircle")
                    Text("SFSymbol.infoCircle")
                }
            }
            .frame(width: 256, height: 256)
            .previewLayout(.sizeThatFits)
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Blur (light) + dark mode")

            ZStack {
                mockGrid
                VisualEffectView(effect: .blur(style: .prominent))
                VStack {
                    Image(systemName: ".infoCircle")
                    Text("SFSymbol.infoCircle")
                }
            }
            .frame(width: 256, height: 256)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Blur (prominent)")

            ZStack {
                mockGrid
                VisualEffectView(effect: .vibrancy(blur: .prominent, vibrancy: .label))
                VStack {
                    Image(systemName: ".infoCircle")
                    Text("SFSymbol.infoCircle")
                }
            }
            .frame(width: 256, height: 256)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Vibrancy (prominent + label)")
        }
    }

    private static var mockGrid: some View {
        HStack(spacing: 4) {
            VStack(spacing: 4) {
                gridElement(with: "faceid", coloured: .systemGreen)
                gridElement(with: "icloudAndArrowDownFill", coloured: .systemRed)
            }

            VStack(spacing: 4) {
                gridElement(with: "forward", coloured: .systemOrange)
                gridElement(with: "lock", coloured: .systemBlue)
            }
        }
        .border(Color.black, width: 2)
    }

    private static func gridElement(with symbolString: String, coloured: Color) -> some View {
        Image(systemName: symbolString)
            .resizable()
            .frame(width: 96, height: 96)
            .padding()
            .border(Color.black, width: 1)
            .background(coloured)
    }
}
#endif
