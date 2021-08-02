public protocol Validateable {
    var isValidated: Bool { get }
    var isNotValidated: Bool { get }
}

public extension Validateable {
    var isNotValidated: Bool { !isValidated }
}
