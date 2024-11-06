//
//  Note.swift
//  MarkdownNotes
//
//  Created by Иван Чабанов on 06/11/2024.
//

import Foundation
import SwiftUI
import AppKit

struct Note: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var lastModified: Date
    var iconColor: Color

    var initials: String {
        let words = title.split(separator: " ")
        let initials = words.prefix(2).compactMap { $0.first }.map { String($0) }
        return initials.joined()
    }

    var snippet: String {
        content.components(separatedBy: .newlines).first ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case content
        case lastModified
        case iconColor
    }
}

extension Note: Hashable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case red
        case green
        case blue
        case opacity
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let nsColor = NSColor(self)
        guard let rgbColor = nsColor.usingColorSpace(.deviceRGB) else {
            throw EncodingError.invalidValue(
                self,
                EncodingError.Context(codingPath: encoder.codingPath,
                                      debugDescription: "Unable to convert Color to deviceRGB color space.")
            )
        }
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        rgbColor.getRed(&red, green: &green, blue: &blue, alpha: &opacity)
        try container.encode(red, forKey: .red)
        try container.encode(green, forKey: .green)
        try container.encode(blue, forKey: .blue)
        try container.encode(opacity, forKey: .opacity)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(CGFloat.self, forKey: .red)
        let green = try container.decode(CGFloat.self, forKey: .green)
        let blue = try container.decode(CGFloat.self, forKey: .blue)
        let opacity = try container.decode(CGFloat.self, forKey: .opacity)
        self.init(.sRGB, red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(opacity))
    }
}
