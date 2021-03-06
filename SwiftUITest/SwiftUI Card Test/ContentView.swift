//
//  ContentView.swift
//  Card Test
//
//  Created by Halid ฤฐรงli on 10.11.2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["๐","๐","๐","๐ฑ","๐","๐","๐ป","๐ฅ","๐","โ","๐","๐น","๐","๐","โฝ","๐พ","๐","๐ก","๐ฟ","๐ป","๐ถ","๐ฌ","๐","๐","๐","๐","๐","๐","๐","๐","โค","๐","๐","๐","๐ณ","๐ช","๐ฉ","๐ธ","๐","๐","๐","๐","๐บ","๐ถ","๐ ","๐","โพ","๐","๐ฝ","๐","๐ต","๐ฎ","๐ฉ","๐","๐ฃ","๐","๐","๐","๐","๐","๐","๐","๐","๐","๐ต","๐","๐","๐ฝ","๐","๐","๐","๐","๐","โ","๐","โต","๐","๐ฑ","๐ฐ","๐ถ","๐ธ","๐ฐ","๐ท","๐","๐ซ","๐ซ","๐","๐ฒ","๐","๐","๐"]
    
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
