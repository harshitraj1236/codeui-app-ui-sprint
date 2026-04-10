import SwiftUI

struct Garage: View {
    @Binding var currentLayer: EVLayers
    
    var body: some View {
        VStack(spacing: 15){
            HStack{
                Button {
                    currentLayer = .Dashboard
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
                Spacer()
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            Spacer()
            
            CarsCollection()
            Spacer()
        }
    }
}
