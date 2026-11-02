import SwiftUI

struct EditExpenseView: View {
    let expense: Expense
    let onSave: (Expense) -> Void
    @State private var expenseTitle: String
    @State private var expenseAmount: Decimal
    @State private var expenseDate: Date
    @Environment(\.dismiss) private var dismiss

    init(expense: Expense, onSave: @escaping (Expense) -> Void) {
        self.expense = expense
        self.onSave = onSave
        _expenseTitle = State(initialValue: expense.title)
        _expenseAmount = State(initialValue: expense.amount)
        _expenseDate = State(initialValue: expense.date)
    }

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Label(
                        expense.category.displayName,
                        systemImage: expense.category
                            .symbolName
                    )
                    .labelStyle(.iconOnly)
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.white)
                    .background(
                        expense.category.color,
                        in: RoundedRectangle(
                            cornerRadius: 7
                        )
                    )
                    .font(.headline)
                    Text(expense.category.displayName)
                        .font(.title)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()

                TextField("Title", text: $expenseTitle)
                    .inputFieldStyle()
                
                TextField("Amount", value: $expenseAmount, format: .number)
                    .keyboardType(.decimalPad)
                    .inputFieldStyle()

                HStack {
                    Text(expenseDate, format: .dateTime.day().month().year())
                        .inputFieldStyle()
                        .overlay {
                            DatePicker("Date", selection: $expenseDate, displayedComponents: .date)
                                .labelsHidden()
                                .colorMultiply(.clear)
                        }
                    Text(expenseDate, format: .dateTime.hour().minute())
                        .inputFieldStyle()
                        .overlay {
                            DatePicker("Date", selection: $expenseDate, displayedComponents: .date)
                                .labelsHidden()
                                .colorMultiply(.clear)
                        }
                        .frame(maxWidth: 65)
                }
                
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    .buttonStyle(SecondaryButtonStyle())
                    
                    Button("Save") {
                        var updated = expense
                        updated.title = expenseTitle
                        updated.amount = expenseAmount
                        updated.date = expenseDate
                        onSave(updated)
                        dismiss()
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
                .padding(.vertical)
            }
            .listRowSeparator(.hidden)
            .padding()

            Spacer()
        }
    }

}

#Preview {
    EditExpenseView(expense: Expense.samples[0]) { _ in }
}
