public struct ErrorInstance: Error {
    private let description: String
    private var localizedDescription: String {
        description
    }
    public init(_ description: String) {
        self.description = description
    }
}
