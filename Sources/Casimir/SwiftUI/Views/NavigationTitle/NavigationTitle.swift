import SwiftUI

/**
 View that renders passed-in `content` but applying given `title` as the navigation title for the `content`.
 */
public struct NavigationTitle<Content: View>: View {
  public let title: String
  @ViewBuilder public let content: () -> Content

  public init(
    _ title: String,
    _ content: @escaping () -> Content
  ) {
    self.title = title
    self.content = content
  }

  public var body: some View {
    content()
      .navigationTitle(title)
  }
}
