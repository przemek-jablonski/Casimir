//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI
//swiftlint:disable all
public extension View {
    @inlinable
    func then(_ body: (inout Self) -> Void) -> Self {
        var result = self
        
        body(&result)
        
        return result
    }
    
    /// Returns a type-erased version of `self`.
    @inlinable
    func eraseToAnyView() -> AnyView {
        return .init(self)
    }
}

public extension View {
    @inlinable
    func backgroundColor(_ color: Color) -> some View {
        background(color.edgesIgnoringSafeArea(.all))
    }
    
    @inlinable
    func backgroundPreference<K: PreferenceKey>(key _: K.Type = K.self, value: K.Value) -> some View {
        background(EmptyView().preference(key: K.self, value: value))
    }
}

public extension View {
    @inlinable
    func inset(_ point: CGPoint) -> some View {
        return offset(x: -point.x, y: -point.y)
    }
    
    @inlinable
    func offset(_ point: CGPoint) -> some View {
        return offset(x: point.x, y: point.y)
    }
}

public extension View {
    @inlinable
    func relativeHeight(
        _ ratio: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        GeometryReader { geometry in
            self.frame(
                height: geometry.size.height * ratio,
                alignment: alignment
            )
        }
    }
    
    @inlinable
    func relativeWidth(
        _ ratio: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        GeometryReader { geometry in
            self.frame(
                width: geometry.size.width * ratio,
                alignment: alignment
            )
        }
    }
    
    @inlinable
    func relativeSize(
        width widthRatio: CGFloat,
        height heightRatio: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        GeometryReader { geometry in
            self.frame(
                width: geometry.size.width * widthRatio,
                height: geometry.size.height * heightRatio,
                alignment: alignment
            )
        }
    }
    
    /// Causes the view to fill into its superview.
    @inlinable
    func fill(alignment: Alignment = .center) -> some View {
        relativeSize(width: 1.0, height: 1.0)
    }
    
    @inlinable
    func fit() -> some View {
        GeometryReader { geometry in
            self.frame(
                width: geometry.size.minimumDimensionLength,
                height: geometry.size.minimumDimensionLength
            )
        }
    }
}

public extension View {
    @inlinable
    func frame(minimum dimensionLength: CGFloat, axis: Axis) -> some View {
        switch axis {
            case .horizontal:
                return frame(minWidth: dimensionLength)
            case .vertical:
                return frame(minWidth: dimensionLength)
        }
    }
    
    /// Positions this view within an invisible frame with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width,
    /// height, or both. If you only specify one of the dimensions, the
    /// resulting view assumes this view's sizing behavior in the other
    /// dimension.
    @inlinable
    func frame(_ size: CGSize?, alignment: Alignment = .center) -> some View {
        frame(width: size?.width, height: size?.height, alignment: alignment)
    }
    
    /// Positions this view within an invisible frame with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width,
    /// height, or both. If you only specify one of the dimensions, the
    /// resulting view assumes this view's sizing behavior in the other
    /// dimension.
    @inlinable
    func frame(minimum size: CGSize?, alignment: Alignment = .center) -> some View {
        frame(minWidth: size?.width, minHeight: size?.height, alignment: alignment)
    }
    
    /// Positions this view within an invisible frame with the specified size.
    ///
    /// Use this method to specify a fixed size for a view's width,
    /// height, or both. If you only specify one of the dimensions, the
    /// resulting view assumes this view's sizing behavior in the other
    /// dimension.
    @inlinable
    func frame(
        minimum minSize: CGSize?,
        maximum maxSize: CGSize?,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            minWidth: minSize?.width,
            maxWidth: maxSize?.width,
            minHeight: minSize?.height,
            maxHeight: maxSize?.height,
            alignment: alignment
        )
    }
    
    @inlinable
    func frameZeroClipped(_ isZeroClipped: Bool = true) -> some View {
        frame(isZeroClipped ? CGSize.zero : nil)
            .clipped()
    }
}

public extension View {
    @inlinable
    func width(_ width: CGFloat?) -> some View {
        frame(width: width)
    }
    
    @inlinable
    func height(_ height: CGFloat?) -> some View {
        frame(height: height)
    }
    
    @inlinable
    func maxWidth(_ width: CGFloat?) -> some View {
        frame(maxWidth: width)
    }
    
    @inlinable
    func maxHeight(_ height: CGFloat?) -> some View {
        frame(maxHeight: height)
    }
    
    @inlinable
    func square(_ sideLength: CGFloat?) -> some View {
        frame(width: sideLength, height: sideLength)
    }
}

public extension View {
    @inlinable
    func hidden(_ isHidden: Bool) -> some View {
        Group {
            if isHidden {
                hidden()
            } else {
                self
            }
        }
    }
}

#if os(macOS)

public extension View {
    @available(*, deprecated, message: "This function is currently unavailable on macOS.")
    @inlinable
    func navigationBarTitle(_ title: String) -> some View {
        return self
    }
    
    @available(*, deprecated, message: "This function is currently unavailable on macOS.")
    @inlinable
    func navigationBarItems<V: View>(trailing: V) -> some View {
        return self
    }
}

#endif
