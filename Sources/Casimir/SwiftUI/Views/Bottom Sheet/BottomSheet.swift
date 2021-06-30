#if canImport(UIKit) && !os(tvOS) && !os(watchOS)
// unavailability: tvOS: DragGesture is unavailable in this OS (and it acts as the backbone of this View)
// unavailability: watchOS: Haptics are not available in watchOS at the moment
import SwiftUI
import UIKit

public enum BottomSheetPosition {
    case top
    case bottom
}

@available(iOS 14, *)
public struct BottomSheet<Content: View>: View {
    public typealias Position = BottomSheetPosition
    internal enum DragState {
        case inactive
        case dragging(translation: CGSize)
    }
    
    private let geometryProxy: GeometryProxy
    private let minHeight: CGFloat
    private let maxHeight: CGFloat
    private let cornerRadius: CGFloat // = 10.0
    private let shadowRadius: CGFloat
    private var content: () -> Content
    
    @Binding private var position: Position
    @GestureState private var dragState = DragState.inactive
    
    private let haptics: Haptics
    
    public init(position: Binding<Position>,
                geometryProxy: GeometryProxy,
                minHeight: CGFloat,
                maxHeight: CGFloat,
                cornerRadius: CGFloat,
                shadowRadius: CGFloat,
                haptics: Haptics,
                content: @escaping () -> Content) {
        self._position = position
        self.geometryProxy = geometryProxy
        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.haptics = haptics
        self.content = content
    }
    
    public var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, _ in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        
        return VStack(spacing: 0) {
            Handle()
                .padding(.top, 8)
            self.content()
                .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .frame(width: UIScreen.main.bounds.width - (position == .bottom ? 16 : 8))
        .backgroundColor(.secondarySystemBackground)
        .cornerRadius(cornerRadius)
        .offset(y: float(from: position) + self.dragState.translation.height)
        .shadow(color: Color.black.opacity(isBottom ? 0.70 : 1.25),
                radius: isBottom ? shadowRadius : shadowRadius * 2)
        .animation(self.dragState.isDragging ? .easeOut : .interpolatingSpring(
                    mass: 1.2,
                    stiffness: 500,
                    damping: 90,
                    initialVelocity: 1))
        .gesture(drag)
        .onChange(of: position, perform: { _ in
            haptics.swipeNudge()
        })
    }
}

private extension BottomSheet {
    var isBottom: Bool {
        position == .bottom
    }
    
    var snappingInversionPoint: CGFloat {
        float(from: .bottom) - (float(from: .bottom) - float(from: .top)) / 3
    }
    
    func onDragEnded(drag: DragGesture.Value?) {
        let verticalDirection = (drag?.predictedEndLocation.y ?? 0) - (drag?.location.y ?? 0)
        let cardTopEdgeLocation = float(from: position) + (drag?.translation.height ?? 0)
        
        let topPositionPoints = float(from: .top)
        let bottomPositionPoints = float(from: .bottom)
        let positionsDelta = float(from: .bottom) - float(from: .top)
        
        let closestPosition: Position
        
        if (cardTopEdgeLocation - topPositionPoints) < (bottomPositionPoints - cardTopEdgeLocation) {
            closestPosition = .top
        } else {
            closestPosition = .bottom
        }
        
        if verticalDirection < -(positionsDelta * 0.66) {
            self.position = .top
            return
        }
        
        if verticalDirection > positionsDelta * 0.33 {
            self.position = .bottom
            return
        }
        
        self.position = closestPosition
    }
    
    func float(from sheetPosition: Position) -> CGFloat {
        switch sheetPosition {
        case .top: return geometryProxy.size.height - maxHeight
        case .bottom: return geometryProxy.size.height - minHeight
        }
    }
}

private extension BottomSheet {
    struct Handle: View {
        var body: some View {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .frame(width: 64, height: 4)
                .foregroundColor(.quaternaryLabel)
        }
    }
}

private extension BottomSheet.DragState {
    var translation: CGSize {
        switch self {
        case .inactive: return .zero
        case .dragging(let translation): return translation
        }
    }
    var isDragging: Bool {
        switch self {
        case .inactive: return false
        case .dragging: return true
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GeometryReader { geometry in
                previewContainer(for: BottomSheet(
                    position: .constant(.bottom),
                    geometryProxy: geometry,
                    minHeight: 100,
                    maxHeight: 500,
                    cornerRadius: 16,
                    shadowRadius: 24,
                    haptics: HapticsGenerator.shared) {
                    previewText()
                })
            }
            .colorScheme(.light)
            
            GeometryReader { geometry in
                previewContainer(for: BottomSheet(
                    position: .constant(.bottom),
                    geometryProxy: geometry,
                    minHeight: 100,
                    maxHeight: 500,
                    cornerRadius: 16,
                    shadowRadius: 24,
                    haptics: HapticsGenerator.shared) {
                    previewText()
                })
            }
            .previewDevice("iPhone 8")
            .colorScheme(.dark)
            
            GeometryReader { geometry in
                previewContainer(for: BottomSheet(
                    position: .constant(.top),
                    geometryProxy: geometry,
                    minHeight: 100,
                    maxHeight: 500,
                    cornerRadius: 16,
                    shadowRadius: 24,
                    haptics: HapticsGenerator.shared) {
                    previewText()
                })
            }
            .colorScheme(.light)
        }
    }
    
    static func previewContainer<Container: View>(for view: BottomSheet<Container>) -> some View {
        ZStack {
//            mockList()
            view
        }
    }
    
    static func previewText(with content: String = LoremIpsum.extraExtraLong,
                            repeating: Int = 15) -> some View {
        Text(String(repeating: content, count: repeating)).background(Color.green.opacity(0.33))
    }
}

#endif
