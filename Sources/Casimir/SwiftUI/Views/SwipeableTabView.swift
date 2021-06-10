//
//  SwipeableTabView.swift
//  automemo-ios
//
//  Created by Przemyslaw Jablonski on 06/08/2020.
//  Copyright © 2020 com.szparag.ios. All rights reserved.
//

import SwiftUI

public struct SwipeableTabView: View {
    let minDragTranslationForSwipe: CGFloat = 50
    @State private var selectedTab = 0
    public var tabs: [TabItem]
    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(tabs, id: \.self) {
                $0.highPriorityGesture(DragGesture().onEnded({
                    self.onSwipe(translation: $0.translation.width)
                }))
            }
        }
    }
}

public extension SwipeableTabView {
    struct TabItem: View, Hashable {
        let tag: Int
        var image: Image
        var subtitle: LocalizedString
        var content: () -> AnyView
        public var body: some View {
            content()
                .tag(tag)
                .tabItem({
                    image
                    Text(subtitle.capitalized)
                })
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(tag)
        }
        public static func == (lhs: SwipeableTabView.TabItem,
                        rhs: SwipeableTabView.TabItem) -> Bool {
            lhs.tag == rhs.tag
        }
    }
}

public extension View {
    func tabItem(tag: Int, image: Image, subtitle: LocalizedString) -> SwipeableTabView.TabItem {
        SwipeableTabView.TabItem(tag: tag,
                                 image: image,
                                 subtitle: subtitle,
                                 content: { self.erased() })
    }
}

private extension SwipeableTabView {
    private func onSwipe(translation: CGFloat) {
        if translation > minDragTranslationForSwipe && selectedTab > 0 {
            selectedTab -= 1
        } else  if translation < -minDragTranslationForSwipe && selectedTab < tabs.count - 1 {
            selectedTab += 1
        }
    }
}

struct SwipeableTabView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeableTabView(tabs: [])
    }
}
