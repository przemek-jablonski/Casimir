//#if !os(tvOS)
//// TODO: unavailable in tvOS due to the DragGesture not supporting tvOS and Siri Remote, find a workaround
//import SwiftUI
//
///**
// SwiftUI's `TabView` wrapper. Enables switching the tabs using the swipe (`DragGesture`).
// */
//public struct SwipeableTabView: View {
//    private let minDragTranslationForSwipe: CGFloat = 50
//    @Binding private var selectedTab: Int = 0
//    public var tabs: [TabItem]
//    public var body: some View {
//        TabView(selection: $selectedTab) {
//            ForEach(tabs, id: \.self) {
//                $0.highPriorityGesture(DragGesture().onEnded({
//                    self.onSwipe(translation: $0.translation.width)
//                }))
//            }
//        }
//    }
//}
//
//public extension SwipeableTabView {
//    init(selection: Binding<Int>, tabs: [SwipeableTabView.TabItem]) {
//        self._selectedTab = selection
//        self.tabs = tabs
//    }
//}
//
//public extension View {
//    func tabItem(tag: Int, image: Image, subtitle: LocalizedString) -> SwipeableTabView.TabItem {
//        SwipeableTabView.TabItem(
//            tag: tag,
//            image: image,
//            subtitle: subtitle) {
//            self.erased()
//        }
//    }
//}
//
//private extension SwipeableTabView {
//    private func onSwipe(translation: CGFloat) {
//        if translation > minDragTranslationForSwipe && selectedTab > 0 {
//            selectedTab -= 1
//        } else  if translation < -minDragTranslationForSwipe && selectedTab < tabs.count - 1 {
//            selectedTab += 1
//        }
//    }
//}
//
//struct SwipeableTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwipeableTabView(tabs: [])
//    }
//}
//#endif
