//
//  CardView.swift
//  learn by Doing
//
//  Created by Harry Lopez on 2/05/22.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTY
    var card: Card
    @State private var fadeIn : Bool = false
    @State private var moveDownwward : Bool = false
    @State private var moveUPward : Bool = false
    @State private var showAlert : Bool = false
    
    var hapticFeedback = UIImpactFeedbackGenerator(style: .heavy)
    // MARK: - BODY
    var body: some View {
        ZStack{
            Image(card.imageName)
                .opacity(fadeIn ? 1.0:0.0)
            
            VStack{
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }//VSTACK
            .offset( y: moveDownwward ?  -218 : -300)
            
            Button(action: {
                hapticFeedback.impactOccurred()
                playSound(sound: "sound-chime", type: "mp3")
                self.showAlert.toggle()
            }, label: {
                HStack {
                    Text(card.callToAction.uppercased())
                        .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(.white)
                }// HSTACK
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
                
            })
            .offset(y: moveUPward ?  210 : 300)
            
        }// ZSTACK
        .frame(width: 335, height: 545  )
        .background(LinearGradient(colors: card.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear(){
            withAnimation(.linear(duration: 1.2)) {
                self.fadeIn.toggle()
            }
            withAnimation(.linear(duration: 0.8)) {
                self.moveDownwward.toggle()
                self.moveUPward.toggle()
            }

        }
        .alert(isPresented: $showAlert){
            Alert(title: Text(card.title),
            message: Text(card.message),
            dismissButton: .default(Text("Ok")))
        }
    }
}
// MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[4])
            .previewLayout(.sizeThatFits)
    }
}
