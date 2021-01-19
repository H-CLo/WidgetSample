//
//  EmojiWidgetView.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/18.
//

import SwiftUI
import WidgetKit

struct EmojiWidgetView: View {
    
    @Environment(\.widgetFamily) var family: WidgetFamily
    let emojiDetails: EmojiDetails
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallEmojiWidgetView(emojiDetails: emojiDetails)
        case .systemMedium:
            MediumEmojiWidgetView(emojiDetails: emojiDetails)
        case .systemLarge:
            LargeEmojiWidgetView(emojiDetails: emojiDetails)
        @unknown default:
            EmptyView()
        }
    }
}

struct EmojiWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiWidgetView(emojiDetails: EmojiDetails(emoji: "--", name: "--", description: "--"))
    }
}
