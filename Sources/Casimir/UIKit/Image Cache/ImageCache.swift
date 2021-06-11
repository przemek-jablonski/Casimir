#if canImport(UIKit)
import UIKit

public protocol ImageCacheDelegate: AnyObject {
    func cache(_ cache: ImageCache, imageCachedSuccesfully image: UIImage)
    func cache(_ cache: ImageCache, imageEvictedFromCached image: UIImage)
}

public protocol ImageCache {
    static var shared: ImageCache { get }
    var delegate: ImageCacheDelegate? { get set }
    func image(for fileName: String, bundle: Bundle) -> UIImage
}
#endif
