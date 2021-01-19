//
//  SmallEmojiWidgetView.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/19.
//

import SwiftUI

struct SmallEmojiWidgetView: View {
    
    let emojiDetails: EmojiDetails
    
    var body: some View {
        ZStack {
            Color(UIColor.systemIndigo)
            VStack {
            Text(emojiDetails.emoji)
                .font(.system(size: 56))
            Text(emojiDetails.name)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding([.leading, .trailing])
                .foregroundColor(.white)
            }
        }
        .widgetURL(emojiDetails.url)
    }
}

struct SmallEmojiWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallEmojiWidgetView(emojiDetails: EmojiProvider.random())
    }
}
