import SwiftUI

extension View {

  public func previewDisplayName(_ device: SafePreviewDevice) -> some View {
    previewDisplayName(device.rawValue)
  }

  public func previewDisplayName(_ descriptiveDevice: SafeDescriptivePreviewDevice) -> some View {
    previewDisplayName(descriptiveDevice.safePreviewDevice)
  }

}
