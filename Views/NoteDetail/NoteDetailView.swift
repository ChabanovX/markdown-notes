//
//  NewDetailView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var viewModel: NoteDetailViewModel
    
    init(viewModel: NoteDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            if viewModel.isEditing {
                TextField("Title", text: $viewModel.title)
                    .font(.title)
                    .padding()
                
                MarkdownEditorView(markdownText: $viewModel.markdownText)
            } else {
                Text(viewModel.title)
                    .font(.title)
                    .padding()
                
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
