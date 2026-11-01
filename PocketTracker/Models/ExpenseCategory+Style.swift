import SwiftUI

extension ExpenseCategory {
    var color: Color {
        switch self {
        case .food: .orange
        case .transport: .blue
        case .shopping: .pink
        case .housing: .brown
        case .entertainment: .purple
        case .health: .red
        case .subscription: .indigo
        case .other: .gray
        }
    }
    
    var symbolName: String {
        switch self {
        case .food: "fork.knife"
        case .transport: "tram.fill"
        case .shopping: "bag.fill"
        case .housing: "house.fill"
        case .entertainment: "popcorn.fill"
        case .health: "cross.case.fill"
        case .subscription: "arrow.triangle.2.circlepath"
        case .other: "ellipsis.circle.fill"
        }
    }
}
