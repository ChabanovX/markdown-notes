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
            if let downAttributedString = try? Down(markdownString: markdownText).toAttributedString() {
                AttributedTextView(attributedString: downAttributedString)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("Invalid Markdown")
                    .foregroundColor(.red)
            }
        }
    }
}
