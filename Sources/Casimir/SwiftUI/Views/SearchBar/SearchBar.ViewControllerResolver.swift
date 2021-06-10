//
//  ViewControllerResolver.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

// https://github.com/Geri-Borbas/iOS.Blog.SwiftUI_Search_Bar_in_Navigation_Bar/blob/main/SwiftUI_Search_Bar_in_Navigation_Bar/SearchBar/ViewControllerResolver.swift

#if canImport(UIKit)
import SwiftUI
import UIKit

internal extension SearchBar {
    final class ViewControllerResolver: UIViewControllerRepresentable {
        
        let onResolve: (UIViewController) -> Void
            
        init(onResolve: @escaping (UIViewController) -> Void) {
            self.onResolve = onResolve
        }
        
        func makeUIViewController(context: Context) -> ParentResolverViewController {
            ParentResolverViewController(onResolve: onResolve)
        }
        
        func updateUIViewController(_ uiViewController: ParentResolverViewController, context: Context) { }
    }

    class ParentResolverViewController: UIViewController {
        
        let onResolve: (UIViewController) -> Void
        
        init(onResolve: @escaping (UIViewController) -> Void) {
            self.onResolve = onResolve
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("Use init(onResolve:) to instantiate ParentResolverViewController.")
        }
            
        override func didMove(toParent parent: UIViewController?) {
            super.didMove(toParent: parent)
            
            if let parent = parent {
                onResolve(parent)
            }
        }
    }
}
#endif
