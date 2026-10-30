import Foundation

struct Expense {
    let id: UUID = UUID()
    var title: String
    var amount: Decimal
    var date: Date
    var category: ExpenseCategory
}

enum ExpenseCategory: CaseIterable {
    case food, transport, shopping, housing, entertainment, health, other
}
