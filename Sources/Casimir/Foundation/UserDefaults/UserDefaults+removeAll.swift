import Foundation

public extension UserDefaults {
  func removeAll() {
    Bundle.allBundles.compactMap(\.bundleIdentifier).forEach(removePersistentDomain(forName: ))
    synchronize()
  }
}
