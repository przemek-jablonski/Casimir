//
//  UIControl+ExpandedRx.swift
//  Pins2
//
//  Created by Przemyslaw Jablonski on 27/05/2019.
//  Copyright © 2019 Przemyslaw Jablonski. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

extension Reactive where Base: UIControl {

    public var tap: ControlEvent<Void> {
        return controlEvent(.touchUpInside)
    }

    public func taps() -> Observable<Void> {
        return tap.asObservable()
    }
}

extension UIControl {
    public func taps() -> Observable<Void> {
        return self.rx.taps()
    }
}
