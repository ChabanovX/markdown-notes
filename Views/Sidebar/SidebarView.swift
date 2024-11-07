//
//  SidebarView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

struct SidebarView: View {
    @ObservedObject var viewModel: SidebarViewModel
    @State private var showDeleteConfirmation = false

    var body: some View {
        List(selection: $viewModel.selectedNote) {
            ForEach(viewModel.filteredNotes) { note in
                NoteRowView(note: note)
                    .tag(note)
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: viewModel.createNewNote) {
                    Image(systemName: "plus")
                }
                Button(action: {
                    showDeleteConfirmation = true
                }) {
                    Image(systemName: "trash")
                }
                .disabled(viewModel.selectedNote == nil)
            }
        }
        .alert(isPresented: $showDeleteConfirmation) {
            Alert(
                title: Text("Delete Note"),
                message: Text("Are you sure you want to delete this note?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let note = viewModel.selectedNote {
                        viewModel.delete(note: note)
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }
}
