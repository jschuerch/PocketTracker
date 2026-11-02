import SwiftUI

extension View {
    func inputFieldStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(
                Color(.secondarySystemBackground),
                in: RoundedRectangle(cornerRadius: 10)
            )
    }
}
