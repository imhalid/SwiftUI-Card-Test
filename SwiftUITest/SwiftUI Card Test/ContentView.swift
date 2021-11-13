//
//  ContentView.swift
//  Card Test
//
//  Created by Halid İçli on 10.11.2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬","🐟","🍀","👀","🚗","🍎","💝","💙","👌","❤","😍","😉","😓","😳","💪","💩","🍸","🔑","💖","🌟","🎉","🌺","🎶","👠","🏈","⚾","🏆","👽","💀","🐵","🐮","🐩","🐎","💣","👃","👂","🍓","💘","💜","👊","💋","😘","😜","😵","🙏","👋","🚽","💃","💎","🚀","🌙","🎁","⛄","🌊","⛵","🏀","🎱","💰","👶","👸","🐰","🐷","🐍","🐫","🔫","👄","🚲","🍉","💛","💚"]
    
    @State var emojisCount = 5
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojis[0..<emojisCount], id: \.self) { emoji in
                    CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }.padding(.horizontal)
                .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.yellow)
    }
    var remove: some View {
        Button {
            if emojisCount > 1 {
            emojisCount -= 1
            }
        } label: {
            HStack {
                Image(systemName: "minus.diamond.fill")
            }
        }
    }
    var add: some View {
        Button {
            if emojisCount < emojis.count {
            emojisCount += 1
            }
        } label: {
            HStack {
                Image(systemName: "plus.diamond.fill")
            }
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 15)
            if isFaceUp {
                shape.strokeBorder(lineWidth: 3)
                shape.fill().foregroundColor(Color.blue)
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(Color.purple)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
