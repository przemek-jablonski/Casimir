import SwiftUI

public struct NavigationViewPreview<Content: SwiftUI.View>: SwiftUI.View {
    private let content: () -> Content
    
    public init(_ content: @escaping () -> Content) {
        self.content = content
        preconditionForRunningAsSwiftUIPreviewOnly()
    }
    
    public var body: some SwiftUI.View {
        NavigationView {
            NavigationLink(
                destination: content(),
                isActive: .constant(true),
                label: { Text(String(describing: content)) })
        }
    }
}
