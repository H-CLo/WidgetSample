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
}

extension EmojiDetails: Identifiable {
    public var id: String {
        emoji
    }
}
