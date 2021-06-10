#if canImport(UIKit)
import SwiftUI
import UIKit

extension View {
    public func hideListSeparators() -> some View {
        introspectTableView(customize: {
            $0.separatorStyle = .none
        })
    }
    
    public func showListSeparators() -> some View {
        introspectTableView(customize: { $0.separatorStyle = .singleLine })
    }
    
    public func hideListExtraneousSeparators() -> some View {
//        if #available(iOS 14.0, *) {
//            // iOS 14 doesn't have extra separators below the list by default.
//        } else {
//            // To remove only extra separators below the list:
        introspectTableView(customize: {
            $0.tableFooterView = UIView()
        })
//        }
    }
    
    public func showListExtraneousSeparators() -> some View {
        introspectTableView(customize: {
            $0.tableFooterView = nil
        })
    }
}
#endif
