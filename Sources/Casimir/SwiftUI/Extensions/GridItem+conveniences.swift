import SwiftUI

public extension GridItem {
  static func adaptive(minimum: CGFloat,
                       maximum: CGFloat = .infinity,
                       spacing: CGFloat? = nil,
                       alignment: Alignment? = nil) -> Self {
    GridItem(.adaptive(minimum: minimum, maximum: maximum), spacing: spacing, alignment: alignment)
  }

  static func fixed(size: CGFloat,
                    spacing: CGFloat? = nil,
                    alignment: Alignment? = nil) -> Self {
    GridItem(.fixed(size), spacing: spacing, alignment: alignment)
  }

  static func flexible(maximum: CGFloat = .infinity,
                       spacing: CGFloat? = nil,
                       alignment: Alignment? = nil) -> Self {
    GridItem(.flexible(maximum: maximum), spacing: spacing, alignment: alignment)
  }
}

public extension GridItem {
  static func adaptive(columns: Int,
                       minimum: CGFloat,
                       maximum: CGFloat = .infinity,
                       spacing: CGFloat? = nil,
                       alignment: Alignment? = nil) -> [Self] {
    (0..<columns).map { _ in
      adaptive(minimum: minimum, maximum: maximum, spacing: spacing, alignment: alignment)
    }
  }

  static func fixed(columns: Int,
                    size: CGFloat,
                    spacing: CGFloat? = nil,
                    alignment: Alignment? = nil) -> [Self] {
    (0..<columns).map { _ in
      fixed(size: size, spacing: spacing, alignment: alignment)
    }
  }

  static func flexible(columns: Int,
                       maximum: CGFloat = .infinity,
                       spacing: CGFloat? = nil,
                       alignment: Alignment? = nil) -> [Self] {
    (0..<columns).map { _ in
      flexible(maximum: maximum, spacing: spacing, alignment: alignment)
    }
  }
}
