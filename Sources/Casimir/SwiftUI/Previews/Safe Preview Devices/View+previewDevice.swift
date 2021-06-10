import SwiftUI

extension View {

    public func previewDevice(_ device: SafePreviewDevice) -> some View {
        previewDevice(device.previewDevice)
    }

    public func previewDevice(_ descriptiveDevice: SafeDescriptivePreviewDevice) -> some View {
        previewDevice(descriptiveDevice.safePreviewDevice)
    }

}
