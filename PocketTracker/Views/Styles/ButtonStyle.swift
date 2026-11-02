import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(.blue, in: RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(.blue)
            .frame(maxWidth: .infinity)
            .padding(12)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
