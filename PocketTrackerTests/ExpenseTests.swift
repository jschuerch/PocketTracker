
import Testing
import Foundation
@testable import PocketTracker


struct ExpenseTests {

    @Test("Each new expense gets a unique id")
    func uniqueIDs() {
        let title = "Apples"
        let amount = Decimal(string: "5.30")!
        let date = Date()
        let category = ExpenseCategory.food
        
        let foodExpense1 = Expense(title: title, amount: amount, date: date, category: category)
        let foodExpense2 = Expense(title: title, amount: amount, date: date, category: category)
        
        #expect(foodExpense1.id != foodExpense2.id)
    }
    
}
