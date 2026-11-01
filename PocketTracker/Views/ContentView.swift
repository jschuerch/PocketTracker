import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = Expense.samples
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Pocket Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Welcome to your personal expense tracker!")

            List {
                ForEach(expenses) { expense in
                    HStack(alignment: .firstTextBaseline) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(expense.title)
                                .font(.headline)
                            
                            Text(expense.category.displayName)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .background(Color.gray, in: RoundedRectangle(cornerRadius: 7))
                                .foregroundStyle(.white)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(expense.amount, format: .currency(code: "CHF"))
                            Text(expense.date, format: .dateTime.day().month().hour().minute())
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .listStyle(.plain)
            
            Button("add Expense") {
                print("Add expense tapped!")
            }
        }
    }
}

#Preview {
    ContentView()
}
