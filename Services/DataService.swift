//
//  DataService.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import Foundation
import SwiftUI

protocol DataServiceProtocol {
    func loadNotes() -> [Note]
    func saveNotes(_ notes: [Note])
}

class DataService: DataServiceProtocol {
    static let shared = DataService()

    private let notesKey = "notesKey"

    private init() {}

    func loadNotes() -> [Note] {
        if let data = UserDefaults.standard.data(forKey: notesKey),
           let notes = try? JSONDecoder().decode([Note].self, from: data) {
            return notes
        }
        return []
    }

    func saveNotes(_ notes: [Note]) {
        if let data = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(data, forKey: notesKey)
        }
    }
}
