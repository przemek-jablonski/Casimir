import UIKit

/**
    Describes adjusting mode to use for calculations (such as getting screen height).
 */
public enum ScreenDimensionAdjustingMode {
    /**
        No adjusting will take place, will return raw data.

        - Note: Eg. if used for getting screen height, then raw screen height value will be returned.
     */
    case none
    /**
        Will return data adjusted for insets of safe area for given window.

        - Note: Eg. if used for getting screen height, then raw screen height will be subtracted by
        vertical measurement of the safe area (top and bottom).
     */
    case safeArea
    /**
        Will return data adjusted with custom rules.

        - Note: Eg. if used for getting screen height, then raw screen height will be subtracted by
        value calculated using custom rules.
        - Note: Custom rules are available to peek in UIResponder+ScreenDimensions extension.
     */
    case custom
}

/**
    Extensions providing standarized measurement data (CGRect's, heights and widths)
    of certain UI elements such as screen, status bar, safe area and navigation bar.
 */
public extension UIResponder {

    //TODO: device orientation may come into play here
    //TODO: https://stackoverflow.com/questions/5677716/how-to-get-the-screen-width-and-height-in-ios

    func getScreenRect(for screen: UIScreen = UIScreen.main) -> CGRect {
        return screen.bounds
    }

    func getScreenHeight(
        for viewController: UIViewController,
        and screen: UIScreen = UIScreen.main,
        and application: UIApplication = UIApplication.shared,
        usingAdjusting adjustingMode: ScreenDimensionAdjustingMode) -> CGFloat {
        switch adjustingMode {
        case .none:
            return getScreenRect(for: screen).height
        case .safeArea:
            return getScreenRect(for: screen).height - getSafeAreaInsetsVertical()
        case .custom:
            return getScreenRect(for: screen).height - (
                    getStatusBarHeight() +
                    getNavigationBarHeight(for: viewController) +
                    getSafeAreaInsets(for: application).bottom)
        }
    }

    func getScreenWidth(
        for screen: UIScreen = UIScreen.main,
        and application: UIApplication = UIApplication.shared,
        usingAdjusting adjustingMode: ScreenDimensionAdjustingMode) -> CGFloat {
        switch adjustingMode {
        case .none:
            return getScreenRect(for: screen).width
        case .safeArea:
            return getScreenRect(for: screen).width - getSafeAreaInsetsHorizontal()
        case .custom:
            return getScreenRect(for: screen).width - getSafeAreaInsetsHorizontal()
        }
    }

    func getScreenWidth(for screen: UIScreen = UIScreen.main) -> CGFloat {
        return getScreenRect(for: screen).width
    }

    func getStatusBarRect(for application: UIApplication = UIApplication.shared) -> CGRect {
        return application.statusBarFrame
    }

    func getStatusBarHeight(for application: UIApplication = UIApplication.shared) -> CGFloat {
        return getStatusBarRect(for: application).height
    }

    func getStatusBarWidth(for application: UIApplication = UIApplication.shared) -> CGFloat {
        return getStatusBarRect(for: application).width
    }

    func getSafeAreaInsets(for application: UIApplication = UIApplication.shared) -> UIEdgeInsets {
        return application.keyWindow?.safeAreaInsets ?? UIEdgeInsets.zero
    }

    func getSafeAreaInsetsVertical(for application: UIApplication = UIApplication.shared) -> CGFloat {
        let insets = getSafeAreaInsets(for: application)
        return insets.top + insets.bottom
    }

    func getSafeAreaInsetsHorizontal(for application: UIApplication = UIApplication.shared) -> CGFloat {
        let insets = getSafeAreaInsets(for: application)
        return insets.left + insets.right
    }

    func getNavigationBarRect(for viewController: UIViewController) -> CGRect {
        return viewController.navigationController?.navigationBar.frame ?? CGRect.zero
    }

    func getNavigationBarHeight(for viewController: UIViewController) -> CGFloat {
        return getNavigationBarRect(for: viewController).height
    }

    func getNavigationBarWidth(for viewController: UIViewController) -> CGFloat {
        return getNavigationBarRect(for: viewController).width
    }
}

public extension UIViewController {
    func getNavigationBarRect() -> CGRect {
        return self.navigationController?.navigationBar.frame ?? CGRect.zero
    }

    func getNavigationBarHeight() -> CGFloat {
        return getNavigationBarRect(for: self).height
    }

    func getNavigationBarWidth() -> CGFloat {
        return getNavigationBarRect(for: self).width
    }

    func getScreenHeight(
        and screen: UIScreen = UIScreen.main,
        and application: UIApplication = UIApplication.shared,
        usingAdjusting adjustingMode: ScreenDimensionAdjustingMode) -> CGFloat {
        return getScreenHeight(
            for: self,
            and: screen,
            and: application,
            usingAdjusting: adjustingMode)
    }
}
