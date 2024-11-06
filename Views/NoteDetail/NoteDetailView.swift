//
//  NewDetailView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var viewModel: NoteDetailViewModel

    var body: some View {
        VStack {
            if viewModel.isEditing {
                MarkdownEditorView(markdownText: $viewModel.markdownText)
            } else {
                MarkdownView(markdownText: viewModel.markdownText)
            }
        }
        .toolbar {
            Button(viewModel.isEditing ? "Done" : "Edit") {
                viewModel.toggleEditMode()
            }
        }
    }
}
