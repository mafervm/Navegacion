import SwiftUI

struct ContentView: View {
    @State var pressed: Bool = false
    @State var place: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("¿A dónde deseas viajar?", text: $place)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Viajaremos a \(place)")
                    .font(.headline)
                    .padding(.bottom)
                
   
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        NavigationLink(destination: TransportOptionsView(transportType: "Avión", opciones: [
                            (name: "Aeromexico", color: Color(hex: "#A1A8BE")),
                            (name: "Anna", color: Color(hex: "#C57D75")),
                            (name: "Volaris", color: Color(hex: "#EDBEE4")),
                            (name: "Viva Aerobus", color: Color(hex: "#B54E4A")),
                            (name: "Mexicana", color: Color(hex: "#E1CC96")),
                            (name: "American Airlines", color: Color(hex: "#648C82")),
                            (name: "TAR Aerolineas", color: Color(hex: "#AC5B67")),
                            (name: "Delta Air Lines", color: Color(hex: "#696892")),
                            (name: "WestJet", color: Color(hex: "#FFC88B")),
                            (name: "United Airlines", color: Color(hex: "#70805D"))
                        ])) {
                            MeansOfTransportView(name: "Avión", icon: "airplane", pressed: $pressed)
                        }
                        
                        NavigationLink(destination: TransportOptionsView(transportType: "Bus", opciones: [
                            (name: "Omnibus", color: Color(hex: "#A1A8BE")),
                            (name: "Senda", color: Color(hex: "#C57D75")),
                            (name: "ETN", color: Color(hex: "#EDBEE4")),
                            (name: "Transpais", color: Color(hex: "#B54E4A")),
                            (name: "ADO", color: Color(hex: "#E1CC96")),
                            (name: "Estrella de Oro", color: Color(hex: "#648C82")),
                            (name: "Futura", color: Color(hex: "#AC5B67")),
                            (name: "Primera Plus", color: Color(hex: "#696892")),
                            (name: "FlixBus", color: Color(hex: "#FFC88B")),
                            (name: "ACN Autobuses", color: Color(hex: "#70805D"))
                        ])) {
                            MeansOfTransportView(name: "Bus", icon: "bus", pressed: $pressed)
                        }
                        
                        NavigationLink(destination: TransportOptionsView(transportType: "Tren", opciones: [
                            (name: "Tren Bala Kodama", color: Color(hex: "#A1A8BE")),
                            (name: "Tren Bala Nozomi", color: Color(hex: "#C57D75")),
                            (name: "Tren Bala Sakura", color: Color(hex: "#EDBEE4")),
                            (name: "Tren Bala Hikari", color: Color(hex: "#B54E4A")),
                            (name: "Tren Bala Hayabusa", color: Color(hex: "#E1CC96")),
                            (name: "JR Yamanote", color: Color(hex: "#648C82")),
                            (name: "JR Chuou", color: Color(hex: "#AC5B67")),
                            (name: "Sanyou Line", color: Color(hex: "#696892")),
                            (name: "Super Line Takamatsu", color: Color(hex: "#FFC88B")),
                            (name: "FujiSubaru Line", color: Color(hex: "#70805D"))
                        ])) {
                            MeansOfTransportView(name: "Tren", icon: "tram", pressed: $pressed)
                        }
                        
                        NavigationLink(destination: TransportOptionsView(transportType: "Ferry", opciones: [
                            (name: "Ferry Osaka", color: Color(hex: "#FFC88B")),
                            (name: "Ferry Kobe", color: Color(hex: "#70805D")),
                            (name: "Corsica Ferries", color: Color(hex: "#EDBEE4")),
                            (name: "Balearia", color: Color(hex: "#B54E4A")),
                            (name: "Grandi Navi Veloci", color: Color(hex: "#E1CC96")),
                            (name: "Grimaldi Lines", color: Color(hex: "#648C82")),
                            (name: "Trasmed GLE", color: Color(hex: "#AC5B67")),
                            (name: "Brittany Ferries", color: Color(hex: "#696892")),
                            (name: "Fred Olsen Express", color: Color(hex: "#FFC88B")),
                            (name: "Naviera Armas", color: Color(hex: "#70805D"))
                        ])) {
                            MeansOfTransportView(name: "Ferry", icon: "ferry.fill", pressed: $pressed)
                        }
                    }
                    .padding()
                }
                
               
                ScrollView {
                    TrainCardView(name: "Tren Bala Kodama", iconColor: Color(hex: "#A1A8BE"))
                    TrainCardView(name: "Tren Bala Nozomi", iconColor: Color(hex: "#C57D75"))
                    TrainCardView(name: "Tren Bala Sakura", iconColor: Color(hex: "#EDBEE4"))
                    TrainCardView(name: "Tren Bala Hikari", iconColor: Color(hex: "#B54E4A"))
                    TrainCardView(name: "Tren Bala Hayabusa", iconColor: Color(hex: "#E1CC96"))
                    TrainCardView(name: "JR Yamanote", iconColor: Color(hex: "#648C82"))
                    TrainCardView(name: "JR Chuou", iconColor: Color(hex: "#AC5B67"))
                    TrainCardView(name: "Sanyou Line", iconColor: Color(hex: "#696892"))
                    TrainCardView(name: "Super Line Takamatsu", iconColor: Color(hex: "#FFC88B"))
                    TrainCardView(name: "FujiSubaru Line", iconColor: Color(hex: "#70805D"))
                }
            }
            .navigationTitle("Medios de Transporte")
        }
    }
}


// PARA COLORES HEXADECIMAL
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

