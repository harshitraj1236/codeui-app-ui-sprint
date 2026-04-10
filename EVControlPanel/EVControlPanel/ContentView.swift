import SwiftUI

enum EVLayers{
    case Splash
    case Dashboard
    case Garage
}

struct ContentView: View {
    
    @State private var currentLayer: EVLayers = .Splash
    
    var body: some View {
        ZStack {
            EVBackground()
            
            Group {
                switch currentLayer {
                case .Splash:
                    SplashScreen(currentLayer: $currentLayer)
                        .transition(.opacity.combined(with: .scale(scale: 0.9)))
                case .Dashboard:
                    EVDashboard(currentLayer: $currentLayer)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                case .Garage:
                    Garage(currentLayer: $currentLayer)
                        .transition(.move(edge: .trailing))
                }
            }
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: currentLayer)
        }
    }
}


#Preview{
    ContentView()
}
