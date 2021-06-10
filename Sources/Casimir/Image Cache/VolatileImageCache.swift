import UIKit

public class VolatileImageCache: NSObject, ImageCache, NSCacheDelegate {
    private let cache: NSCache<AnyObject, UIImage>
    
    public static let shared: ImageCache = VolatileImageCache()
    public weak var delegate: ImageCacheDelegate?
    
    override private init() {
        cache = NSCache<AnyObject, UIImage>()
        super.init()
        cache.evictsObjectsWithDiscardedContent = false
        cache.delegate = self
        
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 100
    }
    
    public func image(for fileName: String, bundle: Bundle) -> UIImage {
        let key = cacheKey(from: fileName, inside: bundle)
        if let cached = cache.object(forKey: key) {
            return cached
        }
        
        if let image = UIImage(named: fileName, in: bundle, with: nil) {
            cache.setObject(image, forKey: key)
            delegate?.cache(self, imageCachedSuccesfully: image)
            return image
        }
        
        return UIImage()
    }
}

private extension VolatileImageCache {
    func cacheKey(from fileName: String, inside bundle: Bundle) -> AnyObject {
        (bundle.bundlePath + fileName) as AnyObject
    }
}

extension VolatileImageCache {
    public func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
        delegate?.cache(self, imageEvictedFromCached: obj as! UIImage)
    }
}
