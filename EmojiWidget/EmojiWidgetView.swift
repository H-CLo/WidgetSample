//
//  EmojiWidgetView.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/18.
//

import SwiftUI

struct EmojiWidgetView: View {
    
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
    }
}

struct EmojiWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiWidgetView(emojiDetails: EmojiDetails(emoji: "--", name: "--", description: "--"))
    }
}
