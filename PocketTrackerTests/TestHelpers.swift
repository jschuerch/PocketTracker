import Foundation

@testable import PocketTracker

func makeExpense(
    title: String = "Test",
    amount: Decimal = 10,
    date: Date,
    category: ExpenseCategory = .other
) -> Expense {
    Expense(title: title, amount: amount, date: date, category: category)
}

func date(
    _ year: Int,
    _ month: Int,
    _ day: Int,
    _ hour: Int = 12,
    _ minute: Int = 0
) -> Date {
    Calendar.current.date(
        from: DateComponents(
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute
        )
    )!
}
