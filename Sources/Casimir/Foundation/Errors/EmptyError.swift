import Foundation

/**
 Error instance with no payload. Can replace `Error?` (`nil` instances).
 
 - Note: Useful in interaction with system APIs, where operations may fail
 without raising explicit Error instance or Error may be `nil`
 (which is problematic when mapping all operation states, eg. using `Swift.Result`
 where `Failure` has to inherit from conrete (non-Optional) `Error` class).
 */
public struct EmptyError: Error {
    public init() {}
}
