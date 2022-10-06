#if canImport(UIKit) && !os(watchOS)
import Foundation
import UIKit
import SwiftUI

// source: https://www.hackingwithswift.com/example-code/media/how-to-read-the-average-color-of-a-uiimage-using-ciareaaverage
public extension UIImage {
    var averageUIColor: UIColor {
        guard let inputImage = CIImage(image: self) else { return .invalid }
        let extentVector = CIVector(x: inputImage.extent.origin.x,
                                    y: inputImage.extent.origin.y,
                                    z: inputImage.extent.size.width,
                                    w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage",
                                    parameters: [
                                        kCIInputImageKey: inputImage,
                                        kCIInputExtentKey: extentVector]) else { return .invalid }
        guard let outputImage = filter.outputImage else { return .invalid }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull ?? kCFNotFound])
        context.render(outputImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255,
                       green: CGFloat(bitmap[1]) / 255,
                       blue: CGFloat(bitmap[2]) / 255,
                       alpha: CGFloat(bitmap[3]) / 255)
    }

    var averageColor: Color {
        Color(averageUIColor)
    }
}

public extension Optional where Wrapped == UIImage {
    var averageUIColor: UIColor {
        self?.averageUIColor ?? .invalid
    }

    var averageColor: Color {
        self?.averageColor ?? .invalid
    }
}
#endif
