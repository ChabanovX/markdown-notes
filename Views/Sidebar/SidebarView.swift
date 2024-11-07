//
//  SidebarView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

struct SidebarView: View {
    @ObservedObject var viewModel: SidebarViewModel

    var body: some View {
        List(selection: $viewModel.selectedNote) {
            ForEach(viewModel.filteredNotes) { note in
                NoteRowView(note: note)
                    .tag(note)
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: viewModel.createNewNote) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
