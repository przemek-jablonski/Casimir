import SwiftUI

/**
 Compound View comprising of `List` with nested `ForEach` OR custom Empty View (`emptyContent`) when there
 is nothing to display.

 - Note: empty view, if displayed, is not nested within `List`.
 - Note: empty view will try to stretch itself so it will fill the screen or parent view it is in.
 - Note: uses `FullScreenView` internally
 */
public struct ListForEachOrEmpty<Data, Id, EmptyView: View, ListView: View>: View
where Data: RandomAccessCollection, Data.Element: Identifiable, Id == Data.Element.ID {

  public enum ListStyle {
    case clean
    case lineSeparated
  }

  public var data: Data
  public var header: AnyView?
  public var footer: AnyView?
  public var listStyle: ListStyle = .lineSeparated
  public let empty: EmptyView
  public let content: (Data.Element) -> ListView

  public var body: some View {
    VStack {
      if self.data.isEmpty {
        self.emptyView
      } else {
        self.listForEach
      }
    }
  }
}

private extension ListForEachOrEmpty {
  private var emptyView: some View {
    empty.frame(
      maxWidth: .infinity,
      maxHeight: .infinity,
      alignment: .center
    )
  }

  private var listForEach: some View {
    List {
      Section(header: header ?? SwiftUI.EmptyView().erased(), footer: footer ?? SwiftUI.EmptyView().erased()) {
        ForEach(self.data, content: self.content)
      }
    }
  }
}

// private extension View {
//    func clearSeparators(_ clear: Bool) -> AnyView {
//        if clear {
//            return hideListSeparators().hideListExtraneousSeparators().erased()
//        } else {
//            return showListSeparators().showListExtraneousSeparators().erased()
//        }
//    }
// }
