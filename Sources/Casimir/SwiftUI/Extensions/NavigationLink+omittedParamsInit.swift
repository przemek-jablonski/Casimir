import SwiftUI

public extension NavigationLink {
  init(_ label: Label, destination: Destination) {
    self.init(destination: destination, label: { label })
  }
}
