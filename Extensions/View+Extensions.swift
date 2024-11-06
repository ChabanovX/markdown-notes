//
//  View+Extensions.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI
import AppKit

extension View {
    func applyCustomBackground() -> some View {
        self.background(Color(nsColor: .controlBackgroundColor))  // Use a similar NSColor
    }
}
