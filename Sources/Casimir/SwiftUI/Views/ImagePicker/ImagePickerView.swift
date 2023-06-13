#if canImport(UIKit) && !os(tvOS) && !os(watchOS)
// unavailability: tvOS: because UIImagePickerController is not supported in this OS
// unavailability: watchOS: UIViewControllerRepresentable translation layer doesn't support this OS
import SwiftUI
import UIKit

public struct ImagePickerView: UIViewControllerRepresentable {
  @Environment(\.presentationMode)
  private var presentationMode
  @Binding public var data: Data?
  public var cropToSquare = false

  public func makeUIViewController(
    context: UIViewControllerRepresentableContext<ImagePickerView>
  ) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    //        picker.allowsEditing = cropToSquare
    //        picker.view.frame = CGRect(origin: picker.view.frame.origin,
    //        size: CGSize(width: 300, height: 50))
    return picker
  }

  public func updateUIViewController(
    _ uiViewController: UIImagePickerController,
    context: UIViewControllerRepresentableContext<ImagePickerView>
  ) {}
}

public extension ImagePickerView {
  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    internal let parent: ImagePickerView

    public init(
      _ parent: ImagePickerView
    ) {
      self.parent = parent
    }

    public func imagePickerController(
      _ picker: UIImagePickerController,
      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
      if let uiImage = info[.originalImage] as? UIImage {
        parent.data = uiImage.pngData()
      }

      parent.presentationMode.wrappedValue.dismiss()
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}
#endif
