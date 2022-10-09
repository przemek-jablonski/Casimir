// import SwiftUI
//
// public extension SwipeableTabView {
//    struct TabItem: View, Hashable {
//        let tag: Int
//        var image: Image
//        var subtitle: LocalizedString
//        var content: () -> AnyView
//        public var body: some View {
//            content()
//                .tag(tag)
//                .tabItem({
//                    image
//                    Text(subtitle.capitalized)
//                })
//        }
//        public func hash(into hasher: inout Hasher) {
//            hasher.combine(tag)
//        }
//        public static func == (lhs: SwipeableTabView.TabItem,
//                               rhs: SwipeableTabView.TabItem) -> Bool {
//            lhs.tag == rhs.tag
//        }
//    }
// }
