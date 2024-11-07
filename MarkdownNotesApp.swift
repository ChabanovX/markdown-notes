//
//  MarkdownNotesApp.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import SwiftUI

@main
struct MarkdownNotesApp: App {
    @StateObject private var sidebarViewModel = SidebarViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                SidebarView(viewModel: sidebarViewModel)
                if let selectedNote = sidebarViewModel.selectedNote {
                    NoteDetailView(viewModel: NoteDetailViewModel(note: selectedNote))
                } else {
                    Text("Select a note")
                        .foregroundColor(.gray)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar) {
                        Image(systemName: "sidebar.leading")
                    }
                }
            }
            .environmentObject(sidebarViewModel)
        }
        .commands {
            SidebarCommands()
        }
    }
    
    private func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}
