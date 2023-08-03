//
//  ViewControllerResolver.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

// https://github.com/Geri-Borbas/iOS.Blog.SwiftUI_Search_Bar_in_Navigation_Bar/blob/main/SwiftUI_Search_Bar_in_Navigation_Bar/SearchBar/ViewControllerResolver.swift

#if canImport(UIKit) && !os(tvOS)  && !os(watchOS)
// unavailability: tvOS: those haxxes here are operating on older Search* API version which wasn't ported to the tvOS
// unavailability: watchOS: UISearchController is unavailable in this OS
import SwiftUI
import UIKit

extension SearchBar {
  internal final class ViewControllerResolver: UIViewControllerRepresentable {

    internal let onResolve: (UIViewController) -> Void

    internal init(
      onResolve: @escaping (UIViewController) -> Void
    ) {
      self.onResolve = onResolve
    }

    internal func makeUIViewController(
      context: Context
    ) -> ParentResolverViewController {
      ParentResolverViewController(onResolve: onResolve)
    }

    internal func updateUIViewController(
      _ uiViewController: ParentResolverViewController,
      context: Context
    ) { }
  }

  internal class ParentResolverViewController: UIViewController {
    internal let onResolve: (UIViewController) -> Void

    internal init(
      onResolve: @escaping (UIViewController) -> Void
    ) {
      self.onResolve = onResolve
      super.init(nibName: nil, bundle: nil)
    }

    internal required init?(
      coder: NSCoder
    ) {
      fatalError("Use init(onResolve:) to instantiate ParentResolverViewController.")
    }

    internal override func didMove(
      toParent parent: UIViewController?
    ) {
      super.didMove(toParent: parent)

      if let parent = parent {
        onResolve(parent)
      }
    }
  }
}
#endif
