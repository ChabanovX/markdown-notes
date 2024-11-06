//
//  MarkdownEditorView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

struct MarkdownEditorView: View {
    @Binding var markdownText: String

    var body: some View {
        TextEditor(text: $markdownText)
            .font(.body)
            .padding()
    }
}
