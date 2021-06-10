#if canImport(UIKit)
import SwiftUI

public extension PreviewProvider {
    static func mockList(
        with textsProvider: () -> String = mockLoremIpsumRegular,
        length: Int = 20,
        randomizeTextColor: Bool = false,
        randomizeRowColor: Bool = false) -> some View {
        List {
            ForEach(0..<length) { _ in
                Text(mockLoremIpsumRegular())
                    .backgroundColor(randomizeTextColor ? .random : .red)
//                    .listRowBackgroundColor(randomizeRowColor ? .random : .green)
            }
        }
    }
}
#endif
