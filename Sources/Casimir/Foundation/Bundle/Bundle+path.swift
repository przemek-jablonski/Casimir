import Foundation

public extension Bundle {
    func path(of fileName: String) -> String? {
        path(forResource: fileName, ofType: nil)
    }

    func url(of fileName: String) -> URL? {
        url(forResource: fileName, withExtension: nil)
    }
}
