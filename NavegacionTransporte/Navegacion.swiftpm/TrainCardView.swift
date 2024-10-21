import SwiftUI

struct TrainCardView: View {
    
    var name: String
    var iconColor: Color
    @State var showAlert: Bool =  false
    
    
    var body: some View {
        VStack(){
            
            HStack(){
                Spacer()
                Text("Oferta")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 12)
                    .background(Color(red: 62/255, green: 132/255, blue: 64/255))
                    .foregroundColor(.white)
                    .cornerRadius(2)
                    .frame( maxWidth: .infinity, alignment: .trailing)
            }
            
            Image(systemName: "tram.circle.fill")
                .font(.system(size: 90, weight: .light, design: .default))
                .foregroundColor(iconColor)
                .aspectRatio(contentMode: .fit )
                .frame(width: 120, height: 100)
            
            Text(name)
                .font(.largeTitle)
                .lineLimit(1)
                .truncationMode(.middle)
                .padding(.bottom)
                .frame( maxWidth: .infinity)
            
        }.modifier(CardViewModifier())
            .gesture(TapGesture().onEnded{ _ in
                self.showAlert.toggle()
            })
            .alert(Text("Has selecionado el tren \(name)") ,isPresented: $showAlert) {
                
            }
    }
}


