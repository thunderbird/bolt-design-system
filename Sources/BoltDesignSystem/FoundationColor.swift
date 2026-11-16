// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

public struct FoundationColor: CustomStringConvertible, Identifiable, Sendable {
    public let token: Token
    public let hex: Int

    public init(hex string: String, token: Token = "", description: String = "") {
        self.init(hex: string.hex, token: token, description: description)
    }

    public init(hex: Int, token: Token = "", description: String = "") {
        self.token = token
        self.hex = hex
        self.description = "\(token) (\(String(hex: hex)))\(description.isEmpty ? "" : ": \(description)")"
    }

    // MARK: CustomStringConvertible
    public let description: String

    // MARK: Identifiable
    public var id: String { token.description }
}

extension FoundationColor: CaseIterable {
    static func allCases(name: String?, level: String? = nil) -> [Self] {
        var colors: [Self] = allCases
        guard let name, !name.isEmpty else {
            return colors
        }
        colors = colors.filter { name == $0.token.name }
        guard let level, !level.isEmpty else {
            return colors
        }
        return colors.filter { level == $0.token.level }
    }

    /// Looks up a color by its token, with or without the `foundation.` prefix, e.g. `blue.700`.
    static func named(_ token: String) -> Self? {
        index[token.hasPrefix("foundation.") ? token : "foundation.\(token)"]
    }

    // MARK: CaseIterable
    public static let allCases: [Self] = [
        Self(hex: 0xF0F8FF, token: "foundation.blue.050", description: ""),
        Self(hex: 0x5FA6E8, token: "foundation.blue.300", description: "Branded text and icons that reinforce Thunderbird identity."),
        Self(hex: 0x58C9FF, token: "foundation.blue.400", description: ""),
        Self(hex: 0x32AEFF, token: "foundation.blue.500", description: ""),
        Self(hex: 0x1B90F5, token: "foundation.blue.600", description: ""),
        Self(hex: 0x1373D9, token: "foundation.blue.700", description: ""),
        Self(hex: 0x0B5CBD, token: "foundation.blue.750", description: "Interactive, selected, linked, or emphasized content."),
        Self(hex: 0x175FB6, token: "foundation.blue.800", description: ""),
        Self(hex: 0x19518F, token: "foundation.blue.900", description: ""),
        Self(hex: 0x262C40, token: "foundation.blue.950", description: ""),
        Self(hex: 0xF4F9F4, token: "foundation.green.050", description: ""),
        Self(hex: 0xDEFAE7, token: "foundation.green.100", description: ""),
        Self(hex: 0xC0F2CF, token: "foundation.green.200", description: ""),
        Self(hex: 0x8EE7AA, token: "foundation.green.300", description: ""),
        Self(hex: 0x55D37E, token: "foundation.green.400", description: ""),
        Self(hex: 0x1D783B, token: "foundation.green.700", description: ""),
        Self(hex: 0x1C5F32, token: "foundation.green.800", description: ""),
        Self(hex: 0x194E2C, token: "foundation.green.900", description: ""),
        Self(hex: 0x082B16, token: "foundation.green.950", description: ""),
        Self(hex: 0xC3CADE, token: "foundation.ink.300", description: ""),
        Self(hex: 0x6E6F9B, token: "foundation.ink.700", description: ""),
        Self(hex: 0xFFFFFF, token: "foundation.neutral.000", description: "Menus, dialogs, cards, floating elements"),
        Self(hex: 0xFCFCFD, token: "foundation.neutral.025", description: "Main application and content background"),
        Self(hex: 0xF7F7F8, token: "foundation.neutral.050", description: "Darkest recessed layer or Primary text and icons requiring the strongest emphasis."),
        Self(hex: 0xEFEFF1, token: "foundation.neutral.100", description: "Hover fills, grouped sections, muted containers"),
        Self(hex: 0xE4E4E7, token: "foundation.neutral.150", description: "Strong separation, selected regions, deeper inset areas"),
        Self(hex: 0xD9D9DE, token: "foundation.neutral.200", description: "Default component outlines and dividers"),
        Self(hex: 0xD4D4D8, token: "foundation.neutral.300", description: "Supporting text and icons with reduced prominence."),
        Self(hex: 0xA1A1AA, token: "foundation.neutral.400", description: "Strong separation, focus-adjacent outlines, emphasized controls or Low-emphasis metadata, hints, and non-critical information."),
        Self(hex: 0x71717A, token: "foundation.neutral.500", description: "Applied frequently for dividers and outlines"),
        Self(hex: 0x71717A, token: "foundation.neutral.600", description: "Low-emphasis metadata, hints, and non-critical information."),
        Self(hex: 0x52525B, token: "foundation.neutral.650", description: "Distinct from deep surfaces"),
        Self(hex: 0x52525B, token: "foundation.neutral.700", description: "Supporting text and icons with reduced prominence."),
        Self(hex: 0x3F3F46, token: "foundation.neutral.750", description: "Strong surface separation"),
        Self(hex: 0x4C4D58, token: "foundation.neutral.800", description: "Text + icon secondary"),
        Self(hex: 0x2B2B2F, token: "foundation.neutral.850", description: "Clearly raised above base"),
        Self(hex: 0x232326, token: "foundation.neutral.900", description: "Quiet grouped or secondary surface"),
        Self(hex: 0x262D3B, token: "foundation.neutral.930", description: "Applied frequently to backgrounds, surfaces, dividers and outlines"),
        Self(hex: 0x1A202C, token: "foundation.neutral.940", description: "Applied frequently for backgrounds, surfaces, dividers and outlines"),
        Self(hex: 0x18181B, token: "foundation.neutral.950", description: "Main application surface or Primary text and icons requiring the strongest emphasis"),
        Self(hex: 0x111113, token: "foundation.neutral.975", description: "Darkest recessed layer"),
        Self(hex: 0xFEC18A, token: "foundation.orange.200", description: ""),
        Self(hex: 0xEA7308, token: "foundation.orange.500", description: ""),
        Self(hex: 0xFBD3F6, token: "foundation.pink.200", description: ""),
        Self(hex: 0xE247C4, token: "foundation.pink.500", description: ""),
        Self(hex: 0xFAF5FF, token: "foundation.purple.050", description: ""),
        Self(hex: 0xF5E8FF, token: "foundation.purple.100", description: ""),
        Self(hex: 0xECD5FF, token: "foundation.purple.200", description: ""),
        Self(hex: 0xDDB4FE, token: "foundation.purple.300", description: "Applied sparingly to highlight information."),
        Self(hex: 0xAE55F7, token: "foundation.purple.500", description: ""),
        Self(hex: 0x8022CE, token: "foundation.purple.700", description: ""),
        Self(hex: 0x6B21A8, token: "foundation.purple.800", description: ""),
        Self(hex: 0x571C87, token: "foundation.purple.900", description: ""),
        Self(hex: 0x3A0764, token: "foundation.purple.950", description: ""),
        Self(hex: 0xFEF2F2, token: "foundation.red.100", description: ""),
        Self(hex: 0xFECACA, token: "foundation.red.200", description: ""),
        Self(hex: 0xFCA5A5, token: "foundation.red.300", description: ""),
        Self(hex: 0xF87171, token: "foundation.red.400", description: ""),
        Self(hex: 0xF05252, token: "foundation.red.500", description: "Used for critical text messaging"),
        Self(hex: 0xDC2626, token: "foundation.red.600", description: ""),
        Self(hex: 0xB91C1C, token: "foundation.red.700", description: ""),
        Self(hex: 0x991B1B, token: "foundation.red.800", description: ""),
        Self(hex: 0x7F1D1D, token: "foundation.red.900", description: ""),
        Self(hex: 0x450A0A, token: "foundation.red.950", description: ""),
        Self(hex: 0xA3ECE3, token: "foundation.teal.200", description: ""),
        Self(hex: 0x25A6A0, token: "foundation.teal.500", description: ""),
        Self(hex: 0x0A84FF, token: "foundation.user-accent.blue", description: ""),
        Self(hex: 0xB0B0B0, token: "foundation.user-accent.graphite", description: ""),
        Self(hex: 0x34C759, token: "foundation.user-accent.green", description: ""),
        Self(hex: 0xFF8C00, token: "foundation.user-accent.orange", description: ""),
        Self(hex: 0xE91E63, token: "foundation.user-accent.pink", description: ""),
        Self(hex: 0x7753CC, token: "foundation.user-accent.purple", description: ""),
        Self(hex: 0xE74642, token: "foundation.user-accent.red", description: ""),
        Self(hex: 0xF4C430, token: "foundation.user-accent.yellow", description: ""),
        Self(hex: 0xFEFAE8, token: "foundation.yellow.050", description: ""),
        Self(hex: 0xFEF2C3, token: "foundation.yellow.100", description: ""),
        Self(hex: 0xFEE78A, token: "foundation.yellow.200", description: ""),
        Self(hex: 0xFDD847, token: "foundation.yellow.300", description: ""),
        Self(hex: 0xFACC15, token: "foundation.yellow.400", description: ""),
        Self(hex: 0xEABD08, token: "foundation.yellow.500", description: ""),
        Self(hex: 0xCAA204, token: "foundation.yellow.600", description: ""),
        Self(hex: 0x713F12, token: "foundation.yellow.900", description: ""),
        Self(hex: 0x423606, token: "foundation.yellow.950", description: "")
    ]

    private static let index: [String: Self] = Dictionary(uniqueKeysWithValues: allCases.map { ($0.id, $0) })
}
