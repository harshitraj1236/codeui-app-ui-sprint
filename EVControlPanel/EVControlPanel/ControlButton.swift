import SwiftUI

struct ControlButton: View {
    
    let icon: String
    let title: String
    @State private var isActive: Bool = false
    
    var body: some View {
        
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 26, weight: .medium))
                .foregroundColor(isActive ? .black : .white)
                .scaleEffect(isActive ? 1.1 : 1)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(isActive ? .black : .gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(.ultraThinMaterial)
        .background(
            isActive ? Color.white.opacity(0.85): Color.clear
        )
        .cornerRadius(22)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.white.opacity(isActive ? 0.0 : 0.25), lineWidth: 1.5)
        )
        .shadow(
            color: isActive ? Color.cyan.opacity(0.6) : Color.black.opacity(0.2),
            radius: isActive ? 15 : 8,
            x: 0,
            y: 8
        )
        
        .scaleEffect(isActive ? 0.93 : 1)
        
        .animation(.spring(response: 0.25, dampingFraction: 0.55), value: isActive)
        
        .onTapGesture {
            isActive.toggle()
            
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        }
    }
}
