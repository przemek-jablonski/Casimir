import SwiftUI

//swiftlint:disable all
let lorem = "Curabitur quis nisl scelerisque, lobortis sapien eu, consequat dolor. Duis ante tortor, tempus ut malesuada a, ullamcorper nec nulla. Suspendisse ultrices nisi ut molestie congue. Integer vulputate diam tortor, vitae aliquam nisl auctor scelerisque. Sed vulputate justo porttitor odio egestas iaculis. In commodo, ex ac commodo facilisis, mauris libero egestas lacus, quis aliquam magna libero id metus. Cras ac nunc lobortis, luctus libero sed, eleifend dui. Curabitur eleifend placerat facilisis. Mauris convallis ante erat, ut ullamcorper leo tempor et. Proin massa enim, lobortis eu justo in, malesuada accumsan dui. In turpis mauris, lacinia nec urna mattis, tincidunt porttitor nisl. Vivamus non iaculis nibh, non tincidunt massa. Sed id malesuada nisi, eu cursus mi. Praesent pharetra varius semper. Morbi lacus diam, sollicitudin sit amet sapien at, ultrices elementum ligula. Sed et est quis est sodales sodales. Praesent eleifend eu nunc vitae elementum. In hac habitasse platea dictumst. Sed a tincidunt elit, vitae laoreet quam. In ut tincidunt augue. Pellentesque venenatis eu justo at aliquet. Aenean nisi ante, dignissim ac cursus sed, ultricies a tellus. Pellentesque elementum tellus vitae felis commodo iaculis. Aliquam tincidunt est at justo condimentum posuere. Etiam et sollicitudin tortor. Cras dui orci, molestie a commodo sit amet, imperdiet et nibh. Nam eu lacus et tortor vestibulum volutpat. Ut dapibus ultrices mauris ut ullamcorper. Donec semper eget ante sit amet lacinia. Cras felis ipsum, elementum eget bibendum sit amet, vulputate ac massa. Sed ornare metus et tellus sagittis volutpat. Nam sodales volutpat elementum. Aenean pulvinar magna leo, eget rhoncus velit dictum sit amet. Etiam fermentum ipsum turpis, sit amet viverra ante dictum bibendum."
let loremWords = lorem.components(separatedBy: " ")
let loremSentences = lorem.components(separatedBy: ". ")

public extension PreviewProvider {

    static func mockLoremIpsumRandomLength() -> String {
        if Bool.random() {
            return (1...3)
                .map({ _ in
                    loremWords.randomElement()!.filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) })
                })
                .joined(separator: ", ")
                .uppercasedFirst
        } else {
            return (1...10)
                .map({ _ in mockLoremIpsumLong() })
                .joined(separator: " ")
        }
    }

    static func mockLoremIpsumOneWord() -> String {
        loremWords
            .filter({ $0.count > 4 })
            .randomElement()!
            .filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) })
            .uppercasedFirst
    }

    static func mockLoremIpsumShort() -> String {
        (1...3)
            .map({ _ in loremWords
                .randomElement()!
                .filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) })
            })
            .joined(separator: ", ")
            .uppercasedFirst
    }

    static func mockLoremIpsumRegular() -> String {
        (4...9).map({ _ in loremWords
            .randomElement()!
            .filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) }) })
            .joined(separator: ", ")
            .uppercasedFirst
            + "."
    }

    static func mockLoremIpsumLong() -> String {
        let random = loremSentences.randomElement()!
        if !CharacterSet.letters.contains(random.last!.unicodeScalars.first!) {
            return random.dropLast() + "."
        }
        return random + "."
    }

    static func mockLoremIpsumExtraLong() -> String {
        (2...3)
            .map({ _ in mockLoremIpsumLong() })
            .joined(separator: " ")
    }

    static func mockLoremIpsumExtraExtraLong() -> String {
        (3...5)
            .map({ _ in mockLoremIpsumLong() })
            .joined(separator: " ")
    }
}
