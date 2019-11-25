import Foundation

extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                return ($0 + " " + String($1))
            } else {
                return $0 + String($1)
            }
        }
    }
}

extension Optional where Wrapped == String {
    func camelCaseToWords() -> String? {
        if let nonOptionalSelf = self {
            return nonOptionalSelf.camelCaseToWords()
        } else {
            return nil
        }
    }
}
