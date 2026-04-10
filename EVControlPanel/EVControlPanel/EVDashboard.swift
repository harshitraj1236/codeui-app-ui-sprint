import SwiftUI

struct EVDashboard: View {
    
    @Binding var currentLayer: EVLayers
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 200), spacing: 20)
    ]
    @State private var showHeader = false
    @State private var showControls = false
    
    var body: some View {
        ZStack {
            EVBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    
                    VStack(spacing: 30) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Tesla Model X")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                                    .fontDesign(.monospaced)
                                Text("Active")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            Button {
                                currentLayer = .Garage
                            } label: {
                                Image(systemName: "car.2.fill")
                                    .font(.title2)
                                    .foregroundColor(.cyan)
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal, 24)
                        .padding(.top, 20)
                        
                        Image("Dashboard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 200)
                            .shadow(color: .cyan.opacity(0.2), radius: 20, x: 0, y: 15)
                        
                        EVBattery(percentage: 0.85)
                            .padding(.vertical, 20)
                    }
                    .opacity(showHeader ? 1 : 0)
                    .offset(y: showHeader ? 0 : 30)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("CONTROLS")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .tracking(2)
                            .padding(.horizontal, 24)
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ControlButton(icon: "fanblades.fill", title: "CLIMATE")
                            ControlButton(icon: "bolt.car.fill", title: "CHARGE")
                            ControlButton(icon: "lock.open.fill", title: "TRUNK")
                            ControlButton(icon: "lightbulb.fill", title: "LIGHTS")
                            ControlButton(icon: "speaker.wave.3.fill", title: "SENTRY")
                            ControlButton(icon: "thermometer.sun.fill", title: "DEFROST")
                        }
                        .padding(.horizontal, 24)
                    }
                    .padding(.bottom, 40)
                    .opacity(showControls ? 1 : 0)
                    .offset(y: showControls ? 0 : 40)
                }
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                showHeader = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    showControls = true
                }
            }
        }
    }
}
