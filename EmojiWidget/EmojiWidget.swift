//
//  EmojiWidget.swift
//  EmojiWidget
//
//  Created by Willey on 2021/1/18.
//

import WidgetKit
import SwiftUI

struct RandomEmojiWidgetProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> RandomEmojiEntry {
        RandomEmojiEntry(date: Date(), emojiDetails: EmojiProvider.random())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (RandomEmojiEntry) -> ()) {
        let entry = RandomEmojiEntry(date: Date(), emojiDetails: EmojiProvider.random())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RandomEmojiEntry>) -> ()) {
        var entries: [RandomEmojiEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = RandomEmojiEntry(date: entryDate, emojiDetails: EmojiProvider.random())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct RandomEmojiEntry: TimelineEntry {
    public let date: Date
    public let emojiDetails: EmojiDetails
}

struct RandomEmojiWidgetEntryView : View {
    var entry: RandomEmojiWidgetProvider.Entry

    var body: some View {
        EmojiWidgetView(emojiDetails: entry.emojiDetails)
    }
}

@main
struct RandomEmojiWidget: Widget {
    let kind: String = "RandomEmojiWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: RandomEmojiWidgetProvider()
        ) { entry in
            RandomEmojiWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Random Emoji Widget")
        .description("Display a widget with an emoji that is updated randomly.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
