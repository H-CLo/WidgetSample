//
//  MyWidgetBundle.swift
//  WidgetSample
//
//  Created by Willey on 2021/1/21.
//

import SwiftUI
import WidgetKit

@main
struct MyWidgetBundle: WidgetBundle {
    
    var body: some Widget {
        MyWidgets()
        RandomEmojiWidget()
        CustomEmojiWidget()
    }
}
