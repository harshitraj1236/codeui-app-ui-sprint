import SwiftUI

struct EVBackground: View {
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
                .opacity(0.95)
            
            Circle()
                .fill(Color.cyan.opacity(0.3))
                .blur(radius: 90)
                .frame(width:350, height:350)
                .offset(x:-100,y: -300)
            
            Circle()
                .fill(Color.blue.opacity(0.2))
                .blur(radius: 100)
                .frame(width: 350, height: 350)
                .offset(x: 150,y: 260)
        }
    }
}
