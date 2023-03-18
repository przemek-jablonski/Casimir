import SwiftUI

public extension View {
  func width(_ exact: CGFloat, alignment: Alignment) -> some View {
    self.frame(width: exact, alignment: alignment)
  }
  
  func height(_ exact: CGFloat, alignment: Alignment) -> some View {
    self.frame(height: exact, alignment: alignment)
  }
  
  func maxWidth(_ limit: CGFloat, alignment: Alignment) -> some View {
    self.frame(maxWidth: limit, alignment: alignment)
  }
  
  func maxHeight(_ limit: CGFloat, alignment: Alignment) -> some View {
    self.frame(maxHeight: limit, alignment: alignment)
  }
}

public extension View {
  func width(_ exact: CGFloat) -> some View {
    self.frame(width: exact)
  }
  
  func height(_ exact: CGFloat) -> some View {
    self.frame(height: exact)
  }
  
  func maxWidth(_ limit: CGFloat) -> some View {
    self.frame(maxWidth: limit)
  }
  
  func maxHeight(_ limit: CGFloat) -> some View {
    self.frame(maxHeight: limit)
  }
}
