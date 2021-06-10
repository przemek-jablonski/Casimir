import Foundation

public extension JSONDecoder {
    func decode<Target: Decodable>(to type: Target.Type, from data: Data) -> Result<Target, Error> {
        do {
            return .success(try decode(type, from: data))
        } catch {
            return .failure(error)
        }
    }
}
