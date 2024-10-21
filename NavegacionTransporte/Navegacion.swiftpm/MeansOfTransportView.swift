import SwiftUI

struct MeansOfTransportView: View {
    
    var name: String
    var icon: String
    @Binding var pressed : Bool
    
    var body: some View {
        
        Label(name, systemImage: icon)
            .rotationEffect(Angle(degrees: pressed ? 180 : 0))
            .modifier(CardViewModifier())
            .onTapGesture {
                withAnimation(){
                    self.pressed.toggle()
                }
            }
    }
}
