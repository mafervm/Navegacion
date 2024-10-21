import SwiftUI

struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
             .background(Color(red: 208/255, green: 217/255, blue: 216/255, opacity: 0.2))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(red: 165/255, green: 190/255, blue: 185/255, opacity: 0.2), lineWidth: 2)
            ).padding()
    }
}

