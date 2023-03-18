/**
 Base protocol to which all proper Models should conform to for scalability and maintenance reasons.
 Conformances:
 - `Hashable` -> storage and equatability (`Hashable` is implicitly `Equatable`)
 - `Codable` -> coding and decoding from serial formats
 - `Identifiable` -> collection diffing and mandatory in most places in SwiftUI
 - `Randomable` -> easy realtime mocking eg. for `PreviewProvider`
 - `Equatable` (implicitly) -> sibling to `Identifiable`, providing equality checking
 */
public typealias ModelProtocol = Hashable & Codable & Identifiable & Randomable


/**
 Base protocol to which all proper Error should conform to for scalability and maintenance reasons.
 Conformances:
 - `Error` -> Standard Swift `Error` conformance
 - `Hashable` -> storage and equatability (`Hashable` is implicitly `Equatable`)
 - `Codable` -> coding and decoding from serial formats
 - `Randomable` -> easy realtime mocking eg. for `PreviewProvider`
 - `Equatable` (implicitly) -> providing equality checking
 */
public typealias ErrorProtocol = Error & Randomable & CaseIterable
