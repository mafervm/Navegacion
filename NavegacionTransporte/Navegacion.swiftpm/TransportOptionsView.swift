import SwiftUI

struct TransportOptionsView: View {
    var transportType: String
    var opciones: [(name: String, color: Color)]
    
    func getIcon(for transportType: String) -> String {
        switch transportType {
        case "Avión":
            return "airplane"
        case "Bus":
            return "bus"
        case "Tren":
            return "tram"
        case "Ferry":
            return "ferry.fill"
        default:
            return "questionmark"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Opciones para \(transportType)")
                    .font(.largeTitle)
                    .padding()
                
                ForEach(opciones, id: \.name) { option in
                    TransportCardView(name: option.name, icon: getIcon(for: transportType), iconColor: option.color)
                }
            }
        }
        .navigationTitle(transportType)
    }
}



