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
