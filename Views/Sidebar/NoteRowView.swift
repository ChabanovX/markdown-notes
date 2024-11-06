//
//  NoteRowView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

struct NoteRowView: View {
    var note: Note

    var body: some View {
        HStack {
            IconView(initials: note.initials, color: note.iconColor)
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                Text(note.snippet)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            Spacer()
            Text(note.lastModified, style: .date)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}
