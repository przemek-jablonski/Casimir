//
//  LifecycleEvent.swift
//  Pins2
//
//  Created by Przemyslaw Jablonski on 19/05/2019.
//  Copyright © 2019 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

public enum LifecycleEvent: Equatable {

    case viewDidLoad
    case viewWillAppear(animated: Bool)
    case viewDidAppear(animated: Bool)
    case viewWillDisappear(animated: Bool)
    case viewDidDisappear(animated: Bool)
    case viewDidLayoutSubviews
    
}
