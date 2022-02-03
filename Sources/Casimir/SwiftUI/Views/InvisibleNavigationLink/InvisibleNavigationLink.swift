import SwiftUI

public struct InvisibleNavigationLink<Destination: View>: View {
    public  init(isActive: Binding<Bool>, destination: @escaping () -> Destination) {
        self.isActive = isActive
        self.destination = destination
    }
    
    public  init<Selected>(isSelected: Binding<Selected?>, destination: @escaping () -> Destination) {
        self.init(isActive: isSelected.navigationBinding(), destination: destination)
    }
    
    private let isActive: Binding<Bool>
    private let destination: () -> Destination
    
    public var body: some View {
        NavigationLink("", destination: destination(), isActive: isActive)
            .frame(width: .zero, height: .zero)
            .hidden()
    }
}
