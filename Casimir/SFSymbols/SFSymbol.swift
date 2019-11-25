import UIKit

extension NSAttributedString {
    static func asSFSymbol(named name: String) -> NSAttributedString {
        NSAttributedString(attachment: NSTextAttachment(image: UIImage(systemName: name)!))
    }
}
