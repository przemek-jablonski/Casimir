import SwiftUI

extension View {
  public func preview(on descriptiveDevice: SafeDescriptivePreviewDevice) -> some View {
    previewDevice(descriptiveDevice.safePreviewDevice).previewDisplayName(descriptiveDevice.name)
  }
}
