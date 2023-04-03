import Foundation

/**
 Base protocol to which all proper errors should conform to for scalability and maintenance reasons.

 Conformances:
 - `Error` -> Standard Swift `Error` conformance
 - `Hashable` -> storage and equatability (`Hashable` is implicitly `Equatable`)
 - `Codable` -> coding and decoding from serial formats
 - `Randomable` -> easy realtime mocking eg. for `PreviewProvider`
 - `Equatable` (implicitly) -> providing equality checking
 */
public typealias ErrorProtocol = Error & Equatable & Randomable
