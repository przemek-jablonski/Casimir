import Foundation

extension Thread {
    open override var debugDescription: String {
        "\(super.debugDescription)(\(self.qualityOfService.debugDescription), priority: \(threadPriority), stack: \(stackSize)B)"
    }
}

extension QualityOfService: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .userInteractive: return "userInteractive"
        case .userInitiated: return "userInitiated"
        case .default: return "default"
        case .utility: return "utility"
        case .background: return "background"
        @unknown default: return "@unknown"
        }
    }
}
