public let emptyString = ""
public let nilString = "NIL"
public func emptyArray<T>() -> [T] { return [T]() }

public extension String {
    var isNotEmpty: Bool { !isEmpty }
    /**
        Returns `true` if `String` has no characters, including whitespaces and newlines.
     
        So, result for this: `""` will be the same as with this: `"   "`.
     */
    var isEmptyNoWhitespaces: Bool { trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
}

public extension Array {
    var isNotEmpty: Bool { !isEmpty }
}

public extension Set {
    var isNotEmpty: Bool { !isEmpty }
}

public extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool { return
        self == nil ||
            self?.isEmpty ?? true ||
            self?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true }
    var isNotNilOrEmpty: Bool { return !self.isNilOrEmpty }
    var valueOrEmpty: String { return isNilOrEmpty ? emptyString : self.unsafelyUnwrapped }
}
