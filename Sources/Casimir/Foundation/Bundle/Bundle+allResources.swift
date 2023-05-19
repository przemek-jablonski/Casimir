import Foundation

public extension Bundle {
  /**
   Recursively searches for all resources in the `Bundle` and returns their access paths, sorted.

   - Note: For quick check if files are present in the Bundle consider going `.map(\.lastPathComponent)`.
   ```
   Bundle.module.allResources.first:
   // file:///~/Library/Developer/Xcode/DerivedData/ProjectName-ekllhmmrzaxssdaigswkgoustfa/Build/Products/Debug-iphonesimulator/Target.xctest/Packages_Target.bundle/file.json

   Bundle.module.allResources.first.map(\.lastPathComponent):
   // file.json
   ```
   */
  var allResources: [URL] {
    let enumerator = FileManager.default.enumerator(atPath: bundlePath)
    var filePaths = [URL]()

    while let filePath = enumerator?.nextObject() as? String {
      filePaths.append(
        bundleURL.appendingPathComponent(filePath)
      )
    }

    return filePaths.sorted(by: { $0.lastPathComponent > $1.lastPathComponent })
  }
}

public extension Array where Element == Bundle {
  /**
   Recursively searches for all resources in all `Bundle`s and returns their access paths.

   - Note: For quick check if files are present in the Bundle consider going `.map(\.lastPathComponent)`.
   ```
   Bundle.module.allResources.first:
   // file:///~/Library/Developer/Xcode/DerivedData/ProjectName-ekllhmmrzaxssdaigswkgoustfa/Build/Products/Debug-iphonesimulator/Target.xctest/Packages_Target.bundle/file.json

   Bundle.module.allResources.first.map(\.lastPathComponent):
   // file.json
   ```
   */
  var allResources: [URL] {
    self.flatMap { bundle in
      bundle.allResources
    }
  }
}
