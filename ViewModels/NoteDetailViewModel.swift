//
//  NoteDetailViewModel.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import Foundation
import SwiftUI

class NoteDetailViewModel: ObservableObject {
    @Published var title: String
    @Published var markdownText: String
    @Published var isEditing: Bool = false

    private var note: Note
    private weak var sidebarViewModel: SidebarViewModel?

    init(note: Note, sidebarViewModel: SidebarViewModel) {
        self.note = note
        self.markdownText = note.content
        self.title = note.title
        self.sidebarViewModel = sidebarViewModel
    }

    func toggleEditMode() {
        if isEditing {
            // Update note
            note.title = title
            note.content = markdownText
            note.lastModified = Date()
            
            // Inform SidebarViewModel
            sidebarViewModel?.update(note: note)
            
        }
        isEditing.toggle()
    }
}
