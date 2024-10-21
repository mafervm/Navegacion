import SwiftUI

struct TransportCardView: View {
    var name: String
    var icon: String  
    var iconColor: Color
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Oferta")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 12)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(2)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
    
            Image(systemName: icon)
                .font(.system(size: 90, weight: .light, design: .default))
                .foregroundColor(iconColor)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 100)
            
            Text(name)
                .font(.largeTitle)
                .lineLimit(1)
                .truncationMode(.middle)
                .padding(.bottom)
                .frame(maxWidth: .infinity)
            
        }
        .modifier(CardViewModifier())
        .gesture(TapGesture().onEnded {
            showAlert.toggle()
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Has seleccionado \(name)"))
        }
    }
}



