/**
 Base protocol to which all proper Models should conform to for scalability and maintainance reasons.
 Conformances:
 - `Hashable` -> storage and equatability (`Hashable` is already `Equatable`)
 - `Codable` -> coding and decoding from serial formats
 - `Identifiable` -> collection diffing and mandatory in most places in SwiftUI
 - `Randomable` -> easy realtime mocking eg. for `PreviewProvider`
 */
public typealias ModelProtocol = Hashable & Codable & Identifiable & Randomable
