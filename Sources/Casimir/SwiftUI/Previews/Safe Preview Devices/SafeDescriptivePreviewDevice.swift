import SwiftUI

//swiftlint:disable identifier_name
public enum SafeDescriptivePreviewDevice {
    var safePreviewDevice: SafePreviewDevice {
        switch self {
        case .mac: return .mac
        case .iphone_se: return .iphoneSE
        case .iphone_old: return .iphone8
        case .iphone_old_plus: return .iphone8plus
        case .iphone_new: return .iphone11ProMax
        case .iphone_new_plus: return .iphone11ProMax
        case .iphone_new_budget: return .iphone11
        case .ipad_tiny: return .ipadMini_5thGen
        case .ipad_small: return .ipad_6thGen
        case .ipad_large: return .ipadAir_3rdGen //10.5"
        case .ipad_pro: return .ipadPro_12_9_inch_3rdGen
        case .appletv: return .appletv_4k
        case .applewatch_old: return .appleWatch2_38mm
        case .applewatch_small: return .appleWatch4_40mm
        case .applewatch_large: return .appleWatch4_44mm
        }
    }

    var name: String {
        switch self {
        case .appletv: return "TV (4K)"
        case .applewatch_old: return "Watch (2/38mm)"
        case .applewatch_small: return "Watch (4/40mm)"
        case .applewatch_large: return "Watch (4/44mm)"
        default: return self.safePreviewDevice.rawValue
        }
    }
    case mac
    case iphone_se
    case iphone_old
    case iphone_old_plus
    case iphone_new
    case iphone_new_plus
    case iphone_new_budget
    case ipad_tiny
    case ipad_small
    case ipad_large
    case ipad_pro
    case appletv
    case applewatch_old
    case applewatch_small
    case applewatch_large
}
