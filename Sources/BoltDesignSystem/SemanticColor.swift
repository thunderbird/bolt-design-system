// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

public struct SemanticColor: CustomStringConvertible, Identifiable, Sendable {
    public let token: Token
    public let color: (any: FoundationColor, dark: FoundationColor?)

    public init(_ any: FoundationColor, dark: FoundationColor? = nil, token: Token = "", description: String = "") {
        self.token = token
        self.color = (any, dark)
        self.description = "\(token)\(description.isEmpty ? "" : ": \(description)")"
    }

    // MARK: CustomStringConvertible
    public let description: String

    // MARK: Identifiable
    public var id: String { token.description }
}

extension SemanticColor {

    /// An accent hue.
    public enum Accent: String, CaseIterable, Sendable {
        case blue, ink, orange, pink, purple, teal
    }

    /// The state of a critical, primary, success or warning color; `soft` is its surface tint.
    public enum State: String, CaseIterable, Sendable {
        case `default`, hover, pressed, soft
    }

    /// A surface level or border.
    public enum Surface: String, CaseIterable, Sendable {
        case base, border, borderIntense = "border-intense", deep, lower, raised, subtle
    }

    /// A role for text and icons.
    public enum TextIcon: String, CaseIterable, Sendable {
        case base, baseInverted = "base-inverted", brand, critical, disabled, highlight, muted, secondary, success, warning
    }

    /// The `semantic.accent` color for an accent.
    public static func accent(_ accent: Accent) -> Self {
        let (any, dark, description): (FoundationColor.Name, FoundationColor.Name, String) =
            switch accent {
            case .blue: (.blue400, .blue400, "Used for accents, gradients, highlights *Do not use with text")
            case .ink: (.ink700, .ink300, "Used for accents, gradients, highlights *Do not use with text")
            case .orange: (.orange500, .orange200, "Used for accents, gradients, highlights *Do not use with text")
            case .pink: (.pink500, .pink200, "Used for accents, gradients, highlights *Do not use with text")
            case .purple: (.purple500, .purple700, "Used for accents, gradients, highlights *Do not use with text")
            case .teal: (.teal500, .teal200, "Used for accents, gradients, highlights *Do not use with text")
            }
        return Self(FoundationColor(any), dark: FoundationColor(dark), token: Token(stringLiteral: "semantic.accent.\(accent.rawValue)"), description: description)
    }

    /// The `semantic.critical` color for a state.
    public static func critical(_ state: State) -> Self {
        let (any, dark, description): (FoundationColor.Name, FoundationColor.Name, String) =
            switch state {
            case .default: (.red800, .red300, "Applied sparingly to show negative feedback/status or dangerous actions.")
            case .hover: (.red900, .red400, "Applied sparingly to show negative feedback/status or dangerous actions.")
            case .pressed: (.red950, .red500, "Applied sparingly to show negative feedback/status or dangerous actions.")
            case .soft: (.red100, .red900, "Applied sparingly to show negative feedback/status or dangerous actions.")
            }
        return Self(FoundationColor(any), dark: FoundationColor(dark), token: Token(stringLiteral: "semantic.critical.\(state.rawValue)"), description: description)
    }

    /// The `semantic.primary` color for a state.
    public static func primary(_ state: State) -> Self {
        let (any, dark, description): (FoundationColor.Name, FoundationColor, String) =
            switch state {
            case .default: (.blue700, FoundationColor(hex: 0x75B4E6, token: "unlisted.primary.default.dark"), "Applied frequently to surfaces highlight actions & information.")
            case .hover: (.blue800, FoundationColor(hex: 0x5FA0D6, token: "unlisted.primary.hover.dark"), "Applied frequently to surfaces highlight actions & information.")
            case .pressed: (.blue900, FoundationColor(hex: 0x4C8CC2, token: "unlisted.primary.pressed.dark"), "Applied frequently to surfaces highlight actions & information.")
            case .soft: (.blue050, FoundationColor(.blue950), "Applied to surfaces")
            }
        return Self(FoundationColor(any), dark: dark, token: Token(stringLiteral: "semantic.primary.\(state.rawValue)"), description: description)
    }

    /// The `semantic.success` color for a state.
    public static func success(_ state: State) -> Self {
        let (any, dark, description): (FoundationColor.Name, FoundationColor, String) =
            switch state {
            case .default: (.green700, FoundationColor(.green100), "Applied sparingly to show positive feedback/status.")
            case .hover: (.green800, FoundationColor(.green200), "Applied sparingly to show positive feedback/status.")
            case .pressed: (.green900, FoundationColor(hex: 0x81D4B5, token: "unlisted.success.pressed.dark"), "Applied sparingly to show positive feedback/status.")
            case .soft: (.green050, FoundationColor(.green950), "Applied to surfaces")
            }
        return Self(FoundationColor(any), dark: dark, token: Token(stringLiteral: "semantic.success.\(state.rawValue)"), description: description)
    }

    /// The `semantic.surface` color for a surface.
    public static func surface(_ surface: Surface) -> Self {
        let (any, dark, description): (FoundationColor.Name, FoundationColor.Name, String) =
            switch surface {
            case .base: (.neutral025, .neutral950, "Main application and content background")
            case .border: (.neutral200, .neutral650, "Strong separation, selected regions, deeper inset areas")
            case .borderIntense: (.neutral400, .neutral500, "Strong separation, focus-adjacent outlines, emphasized controls or Low-emphasis metadata, hints, and non-critical information.")
            case .deep: (.neutral150, .neutral750, "Strong separation, selected regions, deeper inset areas")
            case .lower: (.neutral050, .neutral975, "Darkest recessed layer or Primary text and icons requiring the strongest emphasis.")
            case .raised: (.neutral000, .neutral850, "Menus, dialogs, cards, floating elements")
            case .subtle: (.neutral100, .neutral900, "Hover fills, grouped sections, muted containers")
            }
        return Self(FoundationColor(any), dark: FoundationColor(dark), token: Token(stringLiteral: "semantic.surface.\(surface.rawValue)"), description: description)
    }

    /// The `semantic.text-icon` color for a role.
    public static func textIcon(_ role: TextIcon) -> Self {
        let (any, dark, description): (FoundationColor.Name, FoundationColor.Name, String) =
            switch role {
            case .base: (.neutral950, .neutral050, "Main application surface or Primary text and icons requiring the strongest emphasis")
            case .baseInverted: (.neutral025, .neutral950, "Applied frequently for text and icons.")
            case .brand: (.blue750, .blue300, "Branded text and icons that reinforce Thunderbird identity.")
            case .critical: (.red700, .red400, "Errors, destructive actions, and urgent information.")
            case .disabled: (.neutral400, .neutral500, "Strong separation, focus-adjacent outlines, emphasized controls or Low-emphasis metadata, hints, and non-critical information.")
            case .highlight: (.blue700, .blue400, "Interactive, selected, linked, or emphasized content.")
            case .muted: (.neutral600, .neutral400, "Low-emphasis metadata, hints, and non-critical information.")
            case .secondary: (.neutral700, .neutral300, "Supporting text and icons with reduced prominence.")
            case .success: (.green800, .green400, "Successful states, confirmations, and positive outcomes.")
            case .warning: (.yellow900, .yellow200, "Cautionary information that may require attention.")
            }
        return Self(FoundationColor(any), dark: FoundationColor(dark), token: Token(stringLiteral: "semantic.text-icon.\(role.rawValue)"), description: description)
    }

    /// The `semantic.warning` color for a state.
    public static func warning(_ state: State) -> Self {
        let (any, dark, description): (FoundationColor.Name, FoundationColor.Name, String) =
            switch state {
            case .default: (.yellow400, .yellow100, "Applied sparingly to show warning feedback/status.")
            case .hover: (.yellow500, .yellow200, "Applied sparingly to show warning feedback/status.")
            case .pressed: (.yellow600, .yellow300, "Applied sparingly to show warning feedback/status.")
            case .soft: (.yellow050, .yellow950, "Applied sparingly to show warning feedback/status.")
            }
        return Self(FoundationColor(any), dark: FoundationColor(dark), token: Token(stringLiteral: "semantic.warning.\(state.rawValue)"), description: description)
    }
}

extension SemanticColor: CaseIterable {
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
    /// In token order: accent, critical, primary, success, surface, text-icon, then warning.
    public static let allCases: [Self] =
        Accent.allCases.map(accent) + State.allCases.map(critical) + State.allCases.map(primary) + State.allCases.map(success)
        + Surface.allCases.map(surface) + TextIcon.allCases.map(textIcon) + State.allCases.map(warning)
}
