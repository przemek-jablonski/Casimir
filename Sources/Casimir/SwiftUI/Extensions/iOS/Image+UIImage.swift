#if canImport(UIKit)
import SwiftUI
import UIKit

public extension UIImage {
    // static func instead of init, because `init(named: String)` is failable
    // and it seems that this cannot be fixed with `convenience` initializer
    //    static func named(_ name: String) -> UIImage {
    //        UIImage(named: <#T##String#>, in: <#T##Bundle?#>, with: <#T##Configuration?#>)
    //        UIImage(named: name) ?? UIImage()
    //    }
}

public extension Image {
    init?(uiImageNamed name: String, bundle: Bundle? = nil, failure: (() -> ())? = nil) {
        guard let image = UIImage(named: "\(name).png", in: bundle, with: nil) else {
            failure?()
            return nil
        }
        self.init(uiImage: image)
    }
}
#endif

private extension Data {
    static func contentsOf(url: URL) -> Result<Data, Error> {
        do {
            let data = try self.init(contentsOf: url)
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
    
    static func contentsOf(url: URL) -> Data {
        do {
            return try self.init(contentsOf: url)
        } catch {
            return Data()
        }
    }
}
