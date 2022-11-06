import SwiftUI

@main
struct CasimirPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                content()
                    .navigationTitle("Casimir")
                
            }
        }
    }
}

private extension CasimirPlaygroundApp {
    func content() -> some SwiftUI.View {
        List {
            Text("Hello World")
        }
    }
}
