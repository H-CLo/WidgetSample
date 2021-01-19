//
//  EmojiDetails.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/18.
//

import Foundation

public struct EmojiDetails {
    public let emoji: String
    public let name: String
    public let description: String
    /// 實作Widget Open URL
    public let url: URL?
    
    init(emoji: String, name: String, description: String) {
        self.emoji = emoji
        self.name = name
        self.description = description
        self.url = URL(string: "emoji://\(name.filter({ !$0.isWhitespace }))")
    }
}

extension EmojiDetails: Identifiable {
    public var id: String {
        emoji
    }
}
