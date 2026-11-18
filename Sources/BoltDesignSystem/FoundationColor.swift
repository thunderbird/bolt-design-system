// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

public struct FoundationColor: CustomStringConvertible, Identifiable, Sendable {
    public let token: Token
    public let hex: Int

    /// Creates the palette color with the given name.
    public init(_ name: Name) {
        let definition: (hex: Int, description: String) = name.definition
        self.init(hex: definition.hex, token: Token(stringLiteral: "foundation.\(name.rawValue)"), description: definition.description)
    }

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

extension FoundationColor {

    /// The name of a color in Bolt's foundation palette, such as ``blue700`` for `foundation.blue.700`.
    public enum Name: String, CaseIterable, Sendable {
        case blue050 = "blue.050"
        case blue300 = "blue.300"
        case blue400 = "blue.400"
        case blue500 = "blue.500"
        case blue600 = "blue.600"
        case blue700 = "blue.700"
        case blue750 = "blue.750"
        case blue800 = "blue.800"
        case blue900 = "blue.900"
        case blue950 = "blue.950"
        case green050 = "green.050"
        case green100 = "green.100"
        case green200 = "green.200"
        case green300 = "green.300"
        case green400 = "green.400"
        case green700 = "green.700"
        case green800 = "green.800"
        case green900 = "green.900"
        case green950 = "green.950"
        case ink300 = "ink.300"
        case ink700 = "ink.700"
        case neutral000 = "neutral.000"
        case neutral025 = "neutral.025"
        case neutral050 = "neutral.050"
        case neutral100 = "neutral.100"
        case neutral150 = "neutral.150"
        case neutral200 = "neutral.200"
        case neutral300 = "neutral.300"
        case neutral400 = "neutral.400"
        case neutral500 = "neutral.500"
        case neutral600 = "neutral.600"
        case neutral650 = "neutral.650"
        case neutral700 = "neutral.700"
        case neutral750 = "neutral.750"
        case neutral800 = "neutral.800"
        case neutral850 = "neutral.850"
        case neutral900 = "neutral.900"
        case neutral930 = "neutral.930"
        case neutral940 = "neutral.940"
        case neutral950 = "neutral.950"
        case neutral975 = "neutral.975"
        case orange200 = "orange.200"
        case orange500 = "orange.500"
        case pink200 = "pink.200"
        case pink500 = "pink.500"
        case purple050 = "purple.050"
        case purple100 = "purple.100"
        case purple200 = "purple.200"
        case purple300 = "purple.300"
        case purple500 = "purple.500"
        case purple700 = "purple.700"
        case purple800 = "purple.800"
        case purple900 = "purple.900"
        case purple950 = "purple.950"
        case red100 = "red.100"
        case red200 = "red.200"
        case red300 = "red.300"
        case red400 = "red.400"
        case red500 = "red.500"
        case red600 = "red.600"
        case red700 = "red.700"
        case red800 = "red.800"
        case red900 = "red.900"
        case red950 = "red.950"
        case teal200 = "teal.200"
        case teal500 = "teal.500"
        case userAccentBlue = "user-accent.blue"
        case userAccentGraphite = "user-accent.graphite"
        case userAccentGreen = "user-accent.green"
        case userAccentOrange = "user-accent.orange"
        case userAccentPink = "user-accent.pink"
        case userAccentPurple = "user-accent.purple"
        case userAccentRed = "user-accent.red"
        case userAccentYellow = "user-accent.yellow"
        case yellow050 = "yellow.050"
        case yellow100 = "yellow.100"
        case yellow200 = "yellow.200"
        case yellow300 = "yellow.300"
        case yellow400 = "yellow.400"
        case yellow500 = "yellow.500"
        case yellow600 = "yellow.600"
        case yellow900 = "yellow.900"
        case yellow950 = "yellow.950"

        var definition: (hex: Int, description: String) {
            switch self {
            case .blue050: (0xF0F8FF, "")
            case .blue300: (0x5FA6E8, "Branded text and icons that reinforce Thunderbird identity.")
            case .blue400: (0x58C9FF, "")
            case .blue500: (0x32AEFF, "")
            case .blue600: (0x1B90F5, "")
            case .blue700: (0x1373D9, "")
            case .blue750: (0x0B5CBD, "Interactive, selected, linked, or emphasized content.")
            case .blue800: (0x175FB6, "")
            case .blue900: (0x19518F, "")
            case .blue950: (0x262C40, "")
            case .green050: (0xF4F9F4, "")
            case .green100: (0xDEFAE7, "")
            case .green200: (0xC0F2CF, "")
            case .green300: (0x8EE7AA, "")
            case .green400: (0x55D37E, "")
            case .green700: (0x1D783B, "")
            case .green800: (0x1C5F32, "")
            case .green900: (0x194E2C, "")
            case .green950: (0x082B16, "")
            case .ink300: (0xC3CADE, "")
            case .ink700: (0x6E6F9B, "")
            case .neutral000: (0xFFFFFF, "Menus, dialogs, cards, floating elements")
            case .neutral025: (0xFCFCFD, "Main application and content background")
            case .neutral050: (0xF7F7F8, "Darkest recessed layer or Primary text and icons requiring the strongest emphasis.")
            case .neutral100: (0xEFEFF1, "Hover fills, grouped sections, muted containers")
            case .neutral150: (0xE4E4E7, "Strong separation, selected regions, deeper inset areas")
            case .neutral200: (0xD9D9DE, "Default component outlines and dividers")
            case .neutral300: (0xD4D4D8, "Supporting text and icons with reduced prominence.")
            case .neutral400: (0xA1A1AA, "Strong separation, focus-adjacent outlines, emphasized controls or Low-emphasis metadata, hints, and non-critical information.")
            case .neutral500: (0x71717A, "Applied frequently for dividers and outlines")
            case .neutral600: (0x71717A, "Low-emphasis metadata, hints, and non-critical information.")
            case .neutral650: (0x52525B, "Distinct from deep surfaces")
            case .neutral700: (0x52525B, "Supporting text and icons with reduced prominence.")
            case .neutral750: (0x3F3F46, "Strong surface separation")
            case .neutral800: (0x4C4D58, "Text + icon secondary")
            case .neutral850: (0x2B2B2F, "Clearly raised above base")
            case .neutral900: (0x232326, "Quiet grouped or secondary surface")
            case .neutral930: (0x262D3B, "Applied frequently to backgrounds, surfaces, dividers and outlines")
            case .neutral940: (0x1A202C, "Applied frequently for backgrounds, surfaces, dividers and outlines")
            case .neutral950: (0x18181B, "Main application surface or Primary text and icons requiring the strongest emphasis")
            case .neutral975: (0x111113, "Darkest recessed layer")
            case .orange200: (0xFEC18A, "")
            case .orange500: (0xEA7308, "")
            case .pink200: (0xFBD3F6, "")
            case .pink500: (0xE247C4, "")
            case .purple050: (0xFAF5FF, "")
            case .purple100: (0xF5E8FF, "")
            case .purple200: (0xECD5FF, "")
            case .purple300: (0xDDB4FE, "Applied sparingly to highlight information.")
            case .purple500: (0xAE55F7, "")
            case .purple700: (0x8022CE, "")
            case .purple800: (0x6B21A8, "")
            case .purple900: (0x571C87, "")
            case .purple950: (0x3A0764, "")
            case .red100: (0xFEF2F2, "")
            case .red200: (0xFECACA, "")
            case .red300: (0xFCA5A5, "")
            case .red400: (0xF87171, "")
            case .red500: (0xF05252, "Used for critical text messaging")
            case .red600: (0xDC2626, "")
            case .red700: (0xB91C1C, "")
            case .red800: (0x991B1B, "")
            case .red900: (0x7F1D1D, "")
            case .red950: (0x450A0A, "")
            case .teal200: (0xA3ECE3, "")
            case .teal500: (0x25A6A0, "")
            case .userAccentBlue: (0x0A84FF, "")
            case .userAccentGraphite: (0xB0B0B0, "")
            case .userAccentGreen: (0x34C759, "")
            case .userAccentOrange: (0xFF8C00, "")
            case .userAccentPink: (0xE91E63, "")
            case .userAccentPurple: (0x7753CC, "")
            case .userAccentRed: (0xE74642, "")
            case .userAccentYellow: (0xF4C430, "")
            case .yellow050: (0xFEFAE8, "")
            case .yellow100: (0xFEF2C3, "")
            case .yellow200: (0xFEE78A, "")
            case .yellow300: (0xFDD847, "")
            case .yellow400: (0xFACC15, "")
            case .yellow500: (0xEABD08, "")
            case .yellow600: (0xCAA204, "")
            case .yellow900: (0x713F12, "")
            case .yellow950: (0x423606, "")
            }
        }
    }
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

    // MARK: CaseIterable
    public static let allCases: [Self] = Name.allCases.map { Self($0) }
}
