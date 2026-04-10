import SwiftUI

struct EVBattery: View {
    let percentage: CGFloat
    @State private var animatedPercentage: CGFloat = 0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.05), lineWidth: 24)
            Circle()
                .trim(from: 0, to: animatedPercentage)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [.blue, .cyan, .blue]), center: .center),
                    style: StrokeStyle(lineWidth: 24, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .shadow(color: .cyan.opacity(0.6), radius: 15, x: 0, y: 0)
            
            VStack(spacing: 4) {
                Text("\(Int(percentage * 100))%")
                    .font(.system(size: 54, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                Text("RANGE: 312 MI")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                    .tracking(2)
            }
        }
        .frame(width: 260, height: 260)
        .onAppear {
            withAnimation(.spring(response: 1.5, dampingFraction: 0.8)) {
                animatedPercentage = percentage
            }
        }
    }
}
