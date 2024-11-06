//
//  SidebarViewModel.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import Foundation
import SwiftUI

class SidebarViewModel: ObservableObject {
    private let dataService: DataServiceProtocol

    @Published var notes: [Note] = []
    @Published var filteredNotes: [Note] = []
    @Published var selectedNote: Note?
    @Published var searchText: String = ""

    init(dataService: DataServiceProtocol = DataService.shared) {
        self.dataService = dataService
        loadNotes()
    }

    func loadNotes() {
        self.notes = dataService.loadNotes()
        self.filteredNotes = notes
    }

    func createNewNote() {
        let newNote = Note(id: UUID(), title: "Untitled", content: "", lastModified: Date(), iconColor: .random)
        notes.append(newNote)
        selectedNote = newNote
        saveNotes()
    }

    func select(note: Note) {
        selectedNote = note
    }

    func saveNotes() {
        dataService.saveNotes(notes)
    }

    func filterNotes() {
        if searchText.isEmpty {
            filteredNotes = notes
        } else {
            filteredNotes = notes.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
