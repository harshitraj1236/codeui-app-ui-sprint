
import SwiftUI

struct CarsCollection: View {
    
    let cars = ["Tesla Model 3","Tesla Model Y","Tesla Model S","Tesla Model X","Tesla Model 3","Tesla Model Y","Tesla Model S","Tesla Model X"]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                ForEach(cars , id: \.self){car in
                    GeometryReader{ proxy in
                        let middle = proxy.frame(in: .global).midX
                        let screenSize = UIScreen.main.bounds.width
                        let rotation = Double(1-(middle/screenSize))*20
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.white.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 45)
                                        .stroke(Color.cyan.opacity(0.5),lineWidth: 2)
                                )
                            
                            VStack{
                                Text(car)
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                
                                Image("GarageImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300)
                                    .foregroundColor(.cyan)
                                    .shadow(color: .cyan.opacity(0.8), radius: 15, x: 0, y: 10)
                            }
                        }
                        .rotation3DEffect(
                            Angle(degrees: rotation),
                            axis: (x: 0, y: 1, z: 0),
                            perspective: 0.5
                        )
                        
                        .scaleEffect(middle>100 && middle<200 ? 1.0 : 0.8)
                        .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0), value: middle)
                    }
                    .frame(width: 260, height: 400)
                }
            }
            .padding(40)
        }
        
    }
}
