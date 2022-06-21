//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Andre Vinicius Torres Conrado on 20/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    func rollDices() {
        leftDiceNumber = Int.random(in: 1...6)
        rightDiceNumber = Int.random(in: 1...6)
    }

    var body: some View {
        ZStack {
            Image("background").resizable().ignoresSafeArea(.all)
            VStack {
                Spacer()
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }.padding(.horizontal)
                Spacer()
                Button(action: {
                    rollDices()
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                Spacer()
            }
        }
    }
}

struct DiceView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
