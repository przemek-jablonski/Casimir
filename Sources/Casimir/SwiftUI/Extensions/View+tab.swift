import SFSafeSymbols
import SwiftUI

public extension View {
    func tab<Tab: Hashable>(
        _ tag: Tab,
        symbol: SFSymbol,
        title: LocalizedString
    ) -> some View {
        self.tag(tag)
            .tabItem {
                VStack {
                    Image(systemSymbol: symbol)
                    Text(title.asIs)
                }
            }
    }
}
