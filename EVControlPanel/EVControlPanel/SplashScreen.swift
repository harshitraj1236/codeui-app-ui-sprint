import SwiftUI

struct SplashScreen: View {
    
    @Binding var currentLayer: EVLayers
    @State private var isScanning = false
    @State private var scanSuccess = false
    @State private var scannerOffset: CGFloat = -35
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image("SplashImage")
                    .resizable()
                    .shadow(color: .cyan.opacity(0.8), radius: 30, x: 0, y: 0)
                    .scaledToFit()
                    .padding(.bottom, 50)
                    .blur(radius: isScanning ? 8 : 0)
                
                Text(isScanning ? "AUTHENTICATING..." : "SYSTEM READY")
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    .tracking(2)
                    .foregroundStyle(isScanning ? Color.cyan : Color.gray)
                
                Button {
                    executeBiometricScan()
                } label: {
                    Text(scanSuccess ? "AUTHORIZED" : "ENGAGE")
                        .font(.headline)
                        .fontWeight(.bold)
                        .tracking(2)
                        .foregroundColor(.black)
                        .frame(width: 200, height: 60)
                        .background(scanSuccess ? Color.green : Color.cyan)
                        .cornerRadius(30)
                        .shadow(color: (scanSuccess ? Color.green : Color.cyan).opacity(0.5), radius: 15, x: 0, y: 8)
                }
                .padding(.top, 45)
                .disabled(isScanning)
            }
    
            
            if isScanning {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.black.opacity(0.6))
                        .frame(width: 150, height: 150)
                        .background(.ultraThinMaterial)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
                        )
                    
                    Image(systemName: scanSuccess ? "checkmark.seal.fill" : "faceid")
                        .font(.system(size: 65))
                        .foregroundColor(scanSuccess ? .green : .cyan)
                    
                    if !scanSuccess {
                        Rectangle()
                            .fill(Color.cyan)
                            .frame(width: 80, height: 2)
                            .shadow(color: .cyan, radius: 5, x: 0, y: 0)
                            .offset(y: scannerOffset)
                            .onAppear {
                                withAnimation(.linear(duration: 0.7).repeatForever(autoreverses: true)) {
                                    scannerOffset = 35
                                }
                            }
                    }
                }
                .transition(.scale(scale: 0.8).combined(with: .opacity))
            }
        }
    }
    
    private func executeBiometricScan() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            isScanning = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation(.spring()) {
                scanSuccess = true
            }
            
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                currentLayer = .Dashboard
            }
        }
    }
}
