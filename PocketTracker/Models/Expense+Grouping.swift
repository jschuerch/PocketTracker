import Foundation

extension Expense {
    
    static func groupedByDay(_ expenses: [Expense]) -> [(
        day: Date, expenses: [Expense]
    )] {
        let expensesByDay = Dictionary(grouping: expenses) {
            Calendar.current.startOfDay(for: $0.date)
        }
        
        let sortedDays = expensesByDay.keys.sorted(by: >)
        var result: [(day: Date, expenses: [Expense])] = []
        for day in sortedDays {
            result.append((day, expensesByDay[day]!))
        }
        
        return result
    }
    
}
