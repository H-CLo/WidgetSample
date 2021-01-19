//
//  ContentView.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/18.
//

import SwiftUI

struct ContentView: View {
    
    let emojiData = EmojiProvider.all()
    @State private var visibleEmojiDetails: EmojiDetails?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emojiData, content: { data in
                    Button(action: {
                        visibleEmojiDetails = data
                    }, label: {
                        EmojiItemView(emoji: data.emoji,
                                      emojiName: data.name)
                    })
                })
            }
            .foregroundColor(.black)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("EmojiList")
        }
        /// 實作 Open URL
        .onOpenURL(perform: { url in
            guard let emojiDetails = emojiData.first(where: { $0.url == url }) else {return}
            visibleEmojiDetails = emojiDetails
        })
        .sheet(item: $visibleEmojiDetails, content: { emojiDetails in
            EmojiDetailView(emojiDetails: emojiDetails)
        })
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
