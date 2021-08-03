#if os(iOS) || os(macOS) || os(tvOS)
// unavailability: watchOS: watchOS doesn't include system* color palette

//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

//swiftlint:disable all

public extension Color {
    static var almostClear: Color {
        Color.black.opacity(0.0001)
    }
}

public extension Color {
    /// A color for placeholder text in controls or text fields or text views.
    static var placeholderText: Color {
        return .systemPink
    }
}

public extension Color {
    static var systemRed: Color {
        return .init(.systemRed)
    }
    
    static var systemGreen: Color {
        return .init(.systemGreen)
    }
    
    static var systemBlue: Color {
        return .init(.systemBlue)
    }
    
    static var systemOrange: Color {
        return .init(.systemOrange)
    }
    
    static var systemYellow: Color {
        return .init(.systemYellow)
    }
    
    static var systemPink: Color {
        return .init(.systemPink)
    }
    
    static var systemPurple: Color {
        return .init(.systemPurple)
    }
    
    static var systemTeal: Color {
        return .init(.systemTeal)
    }
    
    static var systemIndigo: Color {
        return .init(.systemIndigo)
    }
    
    static var systemGray: Color {
        return .init(.systemGray)
    }
}

#endif

#if os(iOS) || targetEnvironment(macCatalyst)

public extension Color {
    static var systemGray2: Color {
        return .init(.systemGray2)
    }
    
    static var systemGray3: Color {
        return .init(.systemGray3)
    }
    
    static var systemGray4: Color {
        return .init(.systemGray4)
    }
    
    static var systemGray5: Color {
        return .init(.systemGray5)
    }
    
    static var systemGray6: Color {
        return .init(.systemGray6)
    }
}

/// Foreground colors for static text and related elements.
public extension Color {
    static var label: Color {
        return .init(.label)
    }
    
    static var secondaryLabel: Color {
        return .init(.secondaryLabel)
    }
    
    static var tertiaryLabel: Color {
        return .init(.tertiaryLabel)
    }
    
    static var quaternaryLabel: Color {
        return .init(.quaternaryLabel)
    }
}

public extension Color {
    /// A foreground color for standard system links.
    static var link: Color {
        return .init(.link)
    }
    
    /// A forground color for separators (thin border or divider lines).
    static var separator: Color {
        return .init(.separator)
    }
    
    /// A forground color intended to look similar to `Color.separated`, but is guaranteed to be opaque, so it will.
    static var opaqueSeparator: Color {
        return .init(.opaqueSeparator)
    }
}

public extension Color {
    static var systemBackground: Color {
        return .init(.systemBackground)
    }
    
    static var secondarySystemBackground: Color {
        return .init(.secondarySystemBackground)
    }
    
    static var tertiarySystemBackground: Color {
        return .init(.tertiarySystemBackground)
    }
    
    static var systemGroupedBackground: Color {
        return .init(.systemBackground)
    }
    
    static var secondarySystemGroupedBackground: Color {
        return .init(.secondarySystemGroupedBackground)
    }
    
    static var tertiarySystemGroupedBackground: Color {
        return .init(.tertiarySystemGroupedBackground)
    }
}

/// Fill colors for UI elements.
/// These are meant to be used over the background colors, since their alpha component is less than 1.
public extension Color {
    /// A color  appropriate for filling thin and small shapes.
    ///
    /// Example: The track of a slider.
    static var systemFill: Color {
        return .init(.systemFill)
    }
    
    
    /// A color appropriate for filling medium-size shapes.
    ///
    /// Example: The background of a switch.
    static var secondarySystemFill: Color {
        return .init(.secondarySystemFill)
    }
    
    
    /// A color appropriate for filling large shapes.
    ///
    /// Examples: Input fields, search bars, buttons.
    static var tertiarySystemFill: Color {
        return .init(.tertiarySystemFill)
    }
    
    
    /// A color appropriate for filling large areas containing complex content.
    ///
    /// Example: Expanded table cells.
    static var quaternarySystemFill: Color {
        return .init(.quaternarySystemFill)
    }
}

#endif

#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)

public extension Color {
    /// Creates a color from a hexadecimal color code.
    ///
    /// - Parameter hexadecimal: A hexadecimal representation of the color.
    ///
    /// - Returns: A `Color` from the given color code. Returns `nil` if the code is invalid.
    init!(hexadecimal string: String) {
        var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if string.hasPrefix("#") {
            _ = string.removeFirst()
        }
        
        if !string.count.isMultiple(of: 2), let last = string.last {
            string.append(last)
        }
        
        if string.count > 8 {
            string = String(string.prefix(8))
        }
        
        let scanner = Scanner(string: string)
        
        var color: UInt64 = 0
        
        scanner.scanHexInt64(&color)
        
        if string.count == 2 {
            let mask = 0xFF
            
            let g = Int(color) & mask
            
            let gray = Double(g) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)
        } else if string.count == 4 {
            let mask = 0x00FF
            
            let g = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let gray = Double(g) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)
        } else if string.count == 6 {
            let mask = 0x0000FF
            
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
        } else if string.count == 8 {
            let mask = 0x000000FF
            
            let r = Int(color >> 24) & mask
            let g = Int(color >> 16) & mask
            let b = Int(color >> 8) & mask
            let a = Int(color) & mask
            
            let red = Double(r) / 255.0
            let green = Double(g) / 255.0
            let blue = Double(b) / 255.0
            let alpha = Double(a) / 255.0
            
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
        } else {
            return nil
        }
    }

    /// Creates a color from a 6-digit hexadecimal color code.
    init(hexadecimal6: Int) {
        let red = Double((hexadecimal6 & 0xFF0000) >> 16) / 255.0
        let green = Double((hexadecimal6 & 0x00FF00) >> 8) / 255.0
        let blue = Double(hexadecimal6 & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

#endif
