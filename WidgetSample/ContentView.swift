//
//  ContentView.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/18.
//

import SwiftUI

struct ContentView: View {
    
    let emojiData = EmojiProvider.all()
    @State private var showingDetail: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiData, content: { data in
                    Button(action: {
                        showingDetail.toggle()
                    }, label: {
                        EmojiItemView(emoji: data.emoji,
                                      emojiName: data.name)
                    })
                    .sheet(isPresented: $showingDetail, content: {
                        EmojiDetailView(emojiDetails: data)
                    })
                })
            }
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("EmojiList")
        }
    }
}

struct EmojiItemView: View {
    let emoji: String
    let emojiName: String
    
    var body: some View {
        Text("\(emoji) \(emojiName)")
            .font(.largeTitle)
            .padding([.top, .bottom])
    }
}

struct EmojiDetailView: View {
    
    var emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            // Background color
            Color(UIColor.systemIndigo).edgesIgnoringSafeArea(.all)

            // Emoji data
            VStack {
                VStack(alignment: .leading) {
                HStack {
                    Text("\(emojiDetails.emoji) \(emojiDetails.name)")
                      .font(.largeTitle)
                      .bold()
                }
                .padding()

                Text(emojiDetails.description)
                    .padding([.leading, .trailing, .bottom])
                    .font(.title)
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
