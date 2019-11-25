import UIKit

public extension UITableView {

    /**
        Finds selected rows (if any) in given UITableView and deselects them, optionally with animation.
     */
    func deselectRows(animated: Bool = true) {
        if let selectedIndexes = indexPathsForSelectedRows {
            selectedIndexes.forEach {
                deselectRow(at: $0, animated: animated)
            }
        }
    }

}
