//
//  LifecycleReportingComponent.swift
//  Pins2
//
//  Created by Przemyslaw Jablonski on 19/05/2019.
//  Copyright © 2019 Przemyslaw Jablonski. All rights reserved.
//

import UIKit

class LifecycleReportingComponent {

    private weak var delegate: LifecycleReportingDelegate?

    func report(_ event: LifecycleEvent, for viewController: UIViewController) {
        delegate?.viewController(viewController, reportedLifecycleEvent: event)
    }

    func addDelegate(_ delegate: LifecycleReportingDelegate) {
        precondition(self.delegate == nil)
        self.delegate = delegate
    }

    func removeDelegate(_ delegate: LifecycleReportingDelegate) {
        precondition(self.delegate != nil)
        self.delegate = nil
    }

}
