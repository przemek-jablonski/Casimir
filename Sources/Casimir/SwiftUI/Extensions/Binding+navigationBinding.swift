import SwiftUI

public extension Binding {
  /**
   Wraps and converts `Binding` of given `Type?` to navigationBinding (`Binding<Bool>`),
   meaning that it returns `true` whenever Binding's `wrappedValue` is not nil (i.e. is ready for navigation)
   and returns `false` whenever Binding's `wrappedValue` is nil (i.e. not ready for navigation).

   Useful in parent(list) -> child(detail) navigation scenario, where selecting the list element in parent
   selects given item (as in assigns value to `@State var selected: Model?`)
   and enables the navigation to the child detail view.
   */
  func navigationBinding<Wrapped>() -> Binding<Bool> where Wrapped? == Value {
    Binding<Bool>(
      get: { self.wrappedValue != nil },
      set: { if $0 == false { self.wrappedValue = nil } }
    )
  }
}

public extension NavigationLink {
  init<Selected>(
    isSelected: Binding<Selected?>,
    label: Label,
    destination: @escaping () -> Destination
  ) {
    self.init(destination: destination(), isActive: isSelected.navigationBinding(), label: { label })
  }
}
