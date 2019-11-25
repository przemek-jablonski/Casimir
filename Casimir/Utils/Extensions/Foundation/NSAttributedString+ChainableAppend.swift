import UIKit

extension NSMutableAttributedString {

    func add(_ string: String) -> NSMutableAttributedString {
        append(NSAttributedString(string: string))
        return self
    }

    func add(_ string: NSAttributedString) -> NSMutableAttributedString {
        append(string)
        return self
    }

    func add(sfSymbol named: String, addingSpaces spaces: Bool = true) -> NSMutableAttributedString {
        if spaces { _ = add(" ") }
        append(NSAttributedString(attachment: NSTextAttachment(image: UIImage(systemName: named)!)))
        if spaces { _ = add(" ") }
        return self
    }
}
