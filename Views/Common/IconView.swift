//
//  IconView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

struct IconView: View {
    var initials: String
    var color: Color

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 40, height: 40)
            .overlay(
                Text(initials)
                    .foregroundColor(.white)
                    .font(.headline)
            )
    }
}
