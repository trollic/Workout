import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView {
            MasterView()
        }
    }
}
struct MasterView: View {
    @State private var showDetail = false
    var body: some View {
        VStack {
            NavigationLink(destination: DetailView(showSelf: $showDetail), isActive: $showDetail) {
                Text("Push")
            }
        }
    }
}
struct DetailView: View {
    @Binding var showSelf: Bool
    var body: some View {
        Button(action: {
            self.showSelf = false
        }) {
            Text("Pop")
        }
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
