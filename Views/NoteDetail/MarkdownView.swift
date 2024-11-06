//
//  MarkdownView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI
import Down

struct MarkdownView: View {
    var markdownText: String

    var body: some View {
        ScrollView {
            if let downView = try? Down(markdownString: markdownText).toAttributedString() {
                Text(downView.string)
                    .padding()
                    .textSelection(.enabled)
            } else {
                Text("Invalid Markdown")
                    .foregroundColor(.red)
            }
        }
    }
}
