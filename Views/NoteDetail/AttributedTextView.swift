//
//  AttributedTextView.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 07/11/2024.
//

import SwiftUI
import AppKit

struct AttributedTextView: NSViewRepresentable {
    var attributedString: NSAttributedString

    func makeNSView(context: Context) -> NSTextView {
        let textView = NSTextView()
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.textContainerInset = NSSize(width: 10, height: 10)
        textView.drawsBackground = false
        return textView
    }

    func updateNSView(_ nsView: NSTextView, context: Context) {
        nsView.textStorage?.setAttributedString(attributedString)
    }
}
