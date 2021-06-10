import Foundation

public extension CharacterSet {
    /**
        Returns a character set containing the characters used in punctuating numbers and digits (`.` and `,`).
     */
    static var numericPunctuations: CharacterSet {
        CharacterSet([".", ","])
    }

    /**
        Returns a character set containing the characters in the category of Decimal Numbers,
        unioned with `numericPunctuations` CharacterSet.
     */
    static var decimalDigitsWithPunctuation: CharacterSet {
        decimalDigits.union(.numericPunctuations)
    }
}
