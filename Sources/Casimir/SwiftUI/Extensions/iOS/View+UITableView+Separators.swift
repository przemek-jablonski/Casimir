#if canImport(UIKit) && !os(tvOS) && !os(watchOS)
// unavailability: tvOS: separatorStyle property for UITableView does not exist in this OS
// unavailability: watchOS: watchOS lists have cards instead of rows with separators
import SwiftUI
import UIKit

public extension View {
    func hideListSeparators() -> some View {
        introspectTableView(customize: {
            $0.separatorStyle = .none
        })
    }
    
    func showListSeparators() -> some View {
        introspectTableView(customize: { $0.separatorStyle = .singleLine })
    }
    
    func hideListExtraneousSeparators() -> some View {
        introspectTableView(customize: {
            $0.tableFooterView = UIView()
        })
    }
    
    func showListExtraneousSeparators() -> some View {
        introspectTableView(customize: {
            $0.tableFooterView = nil
        })
    }
}
#endif
