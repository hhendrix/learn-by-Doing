//
//  ContentView.swift
//  learn by Doing
//
//  Created by Harry Lopez on 2/05/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    
    // MARK: - BODY
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 20) {
                ForEach(cardData) { card in
                  CardView(card: card)
                }
            }
            .padding(20)
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
