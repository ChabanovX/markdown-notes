//
//  NoteDetailViewModel.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import Foundation
import SwiftUI

class NoteDetailViewModel: ObservableObject {
    @Published var markdownText: String
    @Published var isEditing: Bool = false

    private var note: Note
    private let dataService: DataServiceProtocol

    init(note: Note, dataService: DataServiceProtocol = DataService.shared) {
        self.note = note
        self.markdownText = note.content
        self.dataService = dataService
    }

    func toggleEditMode() {
        if isEditing {
            // Save changes
            note.content = markdownText
            note.lastModified = Date()
            dataService.saveNotes([note]) // Adjust to save all notes as needed
        }
        isEditing.toggle()
    }
}
