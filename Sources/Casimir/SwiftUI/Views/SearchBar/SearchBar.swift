#if canImport(UIKit)
//
//  SearchBar.swift
//  SwiftUI_Search_Bar_in_Navigation_Bar
//
//  Created by Geri Borbás on 2020. 04. 27..
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

// https://github.com/Geri-Borbas/iOS.Blog.SwiftUI_Search_Bar_in_Navigation_Bar/blob/main/SwiftUI_Search_Bar_in_Navigation_Bar/SearchBar/SearchBar.swift

import SwiftUI
import UIKit

public class SearchBar: NSObject, UISearchResultsUpdating, ObservableObject {
    
    @Published public var text: String = ""
    
    private let searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    public override init() {
        super.init()
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchResultsUpdater = self
    }
    
    public func updateSearchResults(for searchController: UISearchController) {
        if let searchBarText = searchController.searchBar.text {
            self.text = searchBarText
        }
    }
}

public extension SearchBar {
    struct Modifier: ViewModifier {
        let searchBar: SearchBar
        public func body(content: Content) -> some View {
            content
                .overlay(
                    ViewControllerResolver { viewController in
                        viewController.navigationItem.searchController = self.searchBar.searchController
                    }
                    .frame(width: 0, height: 0)
                )
        }
    }
}

public extension View {
    func add(_ searchBar: SearchBar) -> some View {
        self.modifier(SearchBar.Modifier(searchBar: searchBar))
    }
}
#endif
