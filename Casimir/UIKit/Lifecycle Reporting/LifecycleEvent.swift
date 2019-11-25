import Foundation

public enum LifecycleEvent: Equatable {

    case viewDidLoad
    case viewWillAppear(animated: Bool)
    case viewDidAppear(animated: Bool)
    case viewWillDisappear(animated: Bool)
    case viewDidDisappear(animated: Bool)
    case viewDidLayoutSubviews
    
}
