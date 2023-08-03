import SwiftUI

public struct NavigationButtonStyle: PrimitiveButtonStyle {
  public func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      Image(systemName: "chevron.forward")
    }
    .buttonStyle(.plain)
  }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension PrimitiveButtonStyle where Self == NavigationButtonStyle {
  public static var navigation: NavigationButtonStyle {
    NavigationButtonStyle()
  }
}

internal struct NavigationButtonStylePreviews: PreviewProvider {
  static var previews: some View {
    List {
      Button {
        
      } label: {
        HStack {
          Image(systemName: "square.and.arrow.up")
          Text("Automatic Button Style")
        }
      }
      .buttonStyle(.automatic)
      
      Button {
        
      } label: {
        HStack {
          Image(systemName: "square.and.arrow.up")
          Text("Plain Button Style")
        }
      }
      .buttonStyle(.plain)
      
      Button {
        
      } label: {
        HStack {
          Image(systemName: "square.and.arrow.up")
          Text("Navigation Button Style")
        }
      }
      .buttonStyle(.navigation)
      
      Button {
        
      } label: {
        HStack {
          Image(systemName: "square.and.arrow.up")
          Text("Bordered Button Style")
        }
      }
      .buttonStyle(.bordered)
    }
  }
}
