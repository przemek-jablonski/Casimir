import SwiftUI

public extension View {
    func tab<Tab: Hashable>(
        _ tag: Tab,
        image: Image,
        title: LocalizedString
    ) -> some View {
        self.tag(tag)
            .tabItem {
                VStack {
                    image
                    Text(title.asIs)
                }
            }
    }
}
