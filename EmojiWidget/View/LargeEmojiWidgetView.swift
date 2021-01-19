//
//  LargeEmojiWidgetView.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/19.
//

import SwiftUI

struct LargeEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
                Text(emojiDetails.name)
                    .bold()
                    .font(.title)
                Text(emojiDetails.emoji)
                    .font(.system(size: 60))
                    .padding()
                Text(emojiDetails.description)
                    .font(.title3)
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

struct LargeEmojiWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        LargeEmojiWidgetView(emojiDetails: EmojiProvider.random())
    }
}
