import Foundation
import Testing

@testable import PocketTracker

struct ExpenseTests {

    @Test("Each new expense gets a unique id")
    func uniqueIDs() {
        let sameDate = date(2026, 11, 1)
        let expense1 = makeExpense(date: sameDate)
        let expense2 = makeExpense(date: sameDate)

        #expect(expense1.id != expense2.id)
    }

}
