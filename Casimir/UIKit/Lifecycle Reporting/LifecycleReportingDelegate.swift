import UIKit

protocol LifecycleReportingDelegate: AnyObject {
    func viewController(_ viewController: UIViewController, reportedLifecycleEvent: LifecycleEvent)
}
