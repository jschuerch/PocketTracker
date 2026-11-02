import Foundation

struct Expense: Identifiable, Hashable {
    let id: UUID = UUID()
    var title: String
    var amount: Decimal
    var date: Date
    var category: ExpenseCategory
}

enum ExpenseCategory: CaseIterable {
    case food, transport, shopping, housing, entertainment, health, subscription, other
    
    var displayName: String {
        switch self {
        case .food: "Food"
        case .transport: "Transport"
        case .shopping: "Shopping"
        case .housing: "Housing"
        case .entertainment: "Entertainment"
        case .health: "Health"
        case .subscription: "Subscription"
        case .other: "Other"
        }
    }
}
