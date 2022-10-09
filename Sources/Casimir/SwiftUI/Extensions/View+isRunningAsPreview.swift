import SwiftUI

private let swiftUIPreviewEnvironmentKey = "XCODE_RUNNING_FOR_PREVIEWS"

public func isRunningAsSwiftUIPreview() -> Bool {
    ProcessInfo.processInfo.environment[swiftUIPreviewEnvironmentKey] == "1"
}

public func preconditionForRunningAsSwiftUIPreviewOnly() {
    precondition(
        isRunningAsSwiftUIPreview(),
        "Precondition for running as SwiftUI preview was violated. Aborting."
    )
}
