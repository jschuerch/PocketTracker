import SwiftUI

struct ContentView: View {
    @State private var expenses: [Expense] = Expense.samples

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {

                List {
                    ForEach(Expense.groupedByDay(expenses), id: \.day) { group in
                        Section {
                            ForEach(group.expenses) { expense in
                                HStack(alignment: .center) {
                                    Label(
                                        expense.category.displayName,
                                        systemImage: expense.category.symbolName
                                    )
                                    .labelStyle(.iconOnly)
                                    .frame(width: 35, height: 35)
                                    .foregroundStyle(.white)
                                    .background(
                                        expense.category.color,
                                        in: RoundedRectangle(cornerRadius: 7)
                                    )
                                    .font(.headline)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(expense.title)
                                            .font(.headline)
                                    }

                                    Spacer()

                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text(
                                            expense.amount,
                                            format: .currency(code: "CHF")
                                        )
                                        Text(
                                            expense.date,
                                            format: .dateTime.hour()
                                                .minute()
                                        )
                                        .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        } header: {
                            Text(group.day, format: .dateTime.day().month())
                        }
                    }
                }
                .listStyle(.plain)

                Button("add Expense") {
                    print("Add expense tapped!")
                }
                .frame(maxWidth: .infinity)
                .padding()

            }
            .navigationTitle("Pocket Tracker")
        }
    }
}

#Preview {
    ContentView()
}
