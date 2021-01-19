//
//  MediumEmojiWidgetView.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/19.
//

import SwiftUI

struct MediumEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            HStack {
                Text(emojiDetails.emoji)
                    .font(.system(size: 56))
                    .padding()
                VStack(alignment: .leading) {
                    Text(emojiDetails.name)
                        .font(.headline)
                    Text(emojiDetails.description)
                }
                .foregroundColor(.white)
                .padding([.top, .bottom, .trailing])
            }
        }
    }
}

struct MediumEmojiWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumEmojiWidgetView(emojiDetails: EmojiProvider.random())
    }
}
