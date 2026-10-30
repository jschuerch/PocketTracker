import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Pocket Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Welcome to your personal expense tracker!")
            
            Button("add Expense") {
                print("Add expense tapped!")
            }
        }
    }
}

#Preview {
    ContentView()
}
