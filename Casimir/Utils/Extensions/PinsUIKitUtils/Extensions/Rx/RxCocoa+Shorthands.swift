//
//  RxCocoa+Shorthands.swift
//  Pins2
//
//  Created by Przemyslaw Jablonski on 19/05/2019.
//  Copyright © 2019 Przemyslaw Jablonski. All rights reserved.
//

import RxSwift
import RxCocoa

extension UITableView {
    func indexSelects() -> Observable<IndexPath> {
        return self.rx.itemSelected.asObservable()
    }

    func rowSelects() -> Observable<Int> {
        return indexSelects().map { $0.row }
    }
}

extension UISearchBar {
    func textChanges() -> Observable<String?> {
        return self.rx.text.asObservable()
    }

    func cancelButtonClicks() -> Observable<Void> {
        return self.rx.cancelButtonClicked.asObservable()
    }
}
