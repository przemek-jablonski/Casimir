#if canImport(UIKit)
import UIKit

public class PersistentImageCache: ImageCache {

  private var cache: [ImagePath: UIImage]

  public static let shared: ImageCache = PersistentImageCache()
  public var delegate: ImageCacheDelegate?

  private init() {
    cache = Dictionary(minimumCapacity: 50)
  }

  public func image(for fileName: String, bundle: Bundle) -> UIImage {
    let key = cacheKey(from: fileName, inside: bundle)
    if let cached = cache[key] {
      return cached
    }

    if let image = UIImage(named: fileName, in: bundle, with: nil) {
      cache[key] = image
      delegate?.cache(self, imageCachedSuccesfully: image) // TODO: this should be done through `cache.publisher.scan.sink`
      return image
    }

    return UIImage()
  }
}

private extension PersistentImageCache {
  func cacheKey(from fileName: String, inside bundle: Bundle) -> ImagePath {
    (bundle.bundlePath + fileName)
  }
}
#endif
