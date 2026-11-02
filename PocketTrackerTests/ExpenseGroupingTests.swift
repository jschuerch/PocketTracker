import Foundation
import Testing

@testable import PocketTracker

struct ExpenseGroupingTests {

    @Test("An empty list produces no groups")
    func groupedByDayEmptyList() {
        let expenses: [Expense] = []

        let result = Expense.groupedByDay(expenses)

        #expect(result.isEmpty)
    }

    @Test("Expenses on the same day are grouped together")
    func groupedByDaySameDay() throws {
        let expenses: [Expense] = [
            makeExpense(date: date(2026, 11, 1, 9, 0)),
            makeExpense(date: date(2026, 11, 1, 18, 30)),
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 1)
        #expect(result[0].expenses.count == 2)
    }

    @Test("Expenses on different days are grouped separately, newest first")
    func groupedByDayDifferentDays() throws {
        let expenses: [Expense] = [
            makeExpense(date: date(2026, 11, 1, 18, 30)),
            makeExpense(date: date(2026, 11, 3, 9, 0)),
            makeExpense(date: date(2026, 11, 1, 13, 30)),
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 2)
        #expect(result[0].day == date(2026, 11, 3, 0, 0))
        #expect(result[0].expenses.count == 1)
        #expect(result[1].day == date(2026, 11, 1, 0, 0))
        #expect(result[1].expenses.count == 2)
    }

    @Test("Expenses just before and after midnight land on different days")
    func groupedByDayMidnightBoundary() throws {
        let expenses: [Expense] = [
            makeExpense(date: date(2026, 10, 31, 23, 59)),
            makeExpense(date: date(2026, 11, 1, 0, 1)),
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 2)
        #expect(result[0].day == date(2026, 11, 1, 0, 0))
        #expect(result[1].day == date(2026, 10, 31, 0, 0))
    }

    @Test("A group's day is set to midnight")
    func groupedByDayUsesStartOfDay() throws {
        let expenses: [Expense] = [
            makeExpense(date: date(2026, 11, 1, 23, 30))
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 1)
        #expect(result[0].day == date(2026, 11, 1, 0, 0))
    }
    
    @Test("Expenses within a day are sorted newest first")
    func groupedByDaySortsWithinDay() throws {
        let expenses = [
            makeExpense(title: "Morning", date: date(2026, 11, 1, 9, 0)),
            makeExpense(title: "Evening", date: date(2026, 11, 1, 18, 0)),
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 1)
        #expect(result[0].expenses.map(\.title) == ["Evening", "Morning"])
    }

    @Test("No expenses are lost or duplicated")
    func groupedByDayKeepsAllExpenses() {
        let expenses = [
            makeExpense(date: date(2026, 11, 1, 9, 0)),
            makeExpense(date: date(2026, 11, 1, 18, 0)),
            makeExpense(date: date(2026, 11, 2, 12, 0)),
            makeExpense(date: date(2026, 11, 3, 8, 0)),
            makeExpense(date: date(2026, 11, 3, 20, 0)),
        ]

        let result = Expense.groupedByDay(expenses)
        let groupedIDs = result.flatMap { $0.expenses.map(\.id) }

        #expect(groupedIDs.count == expenses.count)
        #expect(Set(groupedIDs) == Set(expenses.map(\.id)))
    }

    @Test("An expense at exactly midnight belongs to the new day")
    func groupedByDayExactlyMidnight() throws {
        let expenses = [
            makeExpense(date: date(2026, 10, 31, 23, 59)),
            makeExpense(date: date(2026, 11, 1, 0, 0)),
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 2)
        #expect(result[0].day == date(2026, 11, 1, 0, 0))
        #expect(result[0].expenses.count == 1)
    }

    @Test("Days across a year boundary are sorted newest first")
    func groupedByDayYearBoundary() throws {
        let expenses = [
            makeExpense(date: date(2026, 12, 31, 20, 0)),
            makeExpense(date: date(2027, 1, 1, 10, 0)),
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 2)
        #expect(result[0].day == date(2027, 1, 1, 0, 0))
        #expect(result[1].day == date(2026, 12, 31, 0, 0))
    }

    @Test("A day with a daylight-saving change is still one group")
    func groupedByDayDaylightSaving() throws {
        // 29 March 2026: clocks jump from 02:00 to 03:00 in Switzerland
        let expenses = [
            makeExpense(date: date(2026, 3, 29, 1, 30)),
            makeExpense(date: date(2026, 3, 29, 3, 30)),
        ]

        let result = Expense.groupedByDay(expenses)

        try #require(result.count == 1)
        #expect(result[0].day == date(2026, 3, 29, 0, 0))
        #expect(result[0].expenses.count == 2)
    }
}
