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
    public static let allCases: [Self] = [
        Self(foundation("blue.400"), dark: foundation("blue.400"), token: "semantic.accent.blue", description: "Used for accents, gradients, highlights *Do not use with text"),
        Self(foundation("ink.700"), dark: foundation("ink.300"), token: "semantic.accent.ink", description: "Used for accents, gradients, highlights *Do not use with text"),
        Self(foundation("orange.500"), dark: foundation("orange.200"), token: "semantic.accent.orange", description: "Used for accents, gradients, highlights *Do not use with text"),
        Self(foundation("pink.500"), dark: foundation("pink.200"), token: "semantic.accent.pink", description: "Used for accents, gradients, highlights *Do not use with text"),
        Self(foundation("purple.500"), dark: foundation("purple.700"), token: "semantic.accent.purple", description: "Used for accents, gradients, highlights *Do not use with text"),
        Self(foundation("teal.500"), dark: foundation("teal.200"), token: "semantic.accent.teal", description: "Used for accents, gradients, highlights *Do not use with text"),
        Self(foundation("red.800"), dark: foundation("red.300"), token: "semantic.critical.default", description: "Applied sparingly to show negative feedback/status or dangerous actions."),
        Self(foundation("red.900"), dark: foundation("red.400"), token: "semantic.critical.hover", description: "Applied sparingly to show negative feedback/status or dangerous actions."),
        Self(foundation("red.950"), dark: foundation("red.500"), token: "semantic.critical.pressed", description: "Applied sparingly to show negative feedback/status or dangerous actions."),
        Self(foundation("red.100"), dark: foundation("red.900"), token: "semantic.critical.soft", description: "Applied sparingly to show negative feedback/status or dangerous actions."),
        Self(foundation("blue.700"), dark: FoundationColor(hex: 0x75B4E6, token: "unlisted.primary.default.dark"), token: "semantic.primary.default", description: "Applied frequently to surfaces highlight actions & information."),
        Self(foundation("blue.800"), dark: FoundationColor(hex: 0x5FA0D6, token: "unlisted.primary.hover.dark"), token: "semantic.primary.hover", description: "Applied frequently to surfaces highlight actions & information."),
        Self(foundation("blue.900"), dark: FoundationColor(hex: 0x4C8CC2, token: "unlisted.primary.pressed.dark"), token: "semantic.primary.pressed", description: "Applied frequently to surfaces highlight actions & information."),
        Self(foundation("blue.050"), dark: foundation("blue.950"), token: "semantic.primary.soft", description: "Applied to surfaces"),
        Self(foundation("green.700"), dark: foundation("green.100"), token: "semantic.success.default", description: "Applied sparingly to show positive feedback/status."),
        Self(foundation("green.800"), dark: foundation("green.200"), token: "semantic.success.hover", description: "Applied sparingly to show positive feedback/status."),
        Self(foundation("green.900"), dark: FoundationColor(hex: 0x81D4B5, token: "unlisted.success.pressed.dark"), token: "semantic.success.pressed", description: "Applied sparingly to show positive feedback/status."),
        Self(foundation("green.050"), dark: foundation("green.950"), token: "semantic.success.soft", description: "Applied to surfaces"),
        Self(foundation("neutral.025"), dark: foundation("neutral.950"), token: "semantic.surface.base", description: "Main application and content background"),
        Self(foundation("neutral.200"), dark: foundation("neutral.650"), token: "semantic.surface.border", description: "Strong separation, selected regions, deeper inset areas"),
        Self(
            foundation("neutral.400"), dark: foundation("neutral.500"), token: "semantic.surface.border-intense",
            description: "Strong separation, focus-adjacent outlines, emphasized controls or Low-emphasis metadata, hints, and non-critical information."),
        Self(foundation("neutral.150"), dark: foundation("neutral.750"), token: "semantic.surface.deep", description: "Strong separation, selected regions, deeper inset areas"),
        Self(foundation("neutral.050"), dark: foundation("neutral.975"), token: "semantic.surface.lower", description: "Darkest recessed layer or Primary text and icons requiring the strongest emphasis."),
        Self(foundation("neutral.000"), dark: foundation("neutral.850"), token: "semantic.surface.raised", description: "Menus, dialogs, cards, floating elements"),
        Self(foundation("neutral.100"), dark: foundation("neutral.900"), token: "semantic.surface.subtle", description: "Hover fills, grouped sections, muted containers"),
        Self(foundation("neutral.950"), dark: foundation("neutral.050"), token: "semantic.text-icon.base", description: "Main application surface or Primary text and icons requiring the strongest emphasis"),
        Self(foundation("neutral.025"), dark: foundation("neutral.950"), token: "semantic.text-icon.base-inverted", description: "Applied frequently for text and icons."),
        Self(foundation("blue.750"), dark: foundation("blue.300"), token: "semantic.text-icon.brand", description: "Branded text and icons that reinforce Thunderbird identity."),
        Self(foundation("red.700"), dark: foundation("red.400"), token: "semantic.text-icon.critical", description: "Errors, destructive actions, and urgent information."),
        Self(foundation("neutral.400"), dark: foundation("neutral.500"), token: "semantic.text-icon.disabled", description: "Strong separation, focus-adjacent outlines, emphasized controls or Low-emphasis metadata, hints, and non-critical information."),
        Self(foundation("blue.700"), dark: foundation("blue.400"), token: "semantic.text-icon.highlight", description: "Interactive, selected, linked, or emphasized content."),
        Self(foundation("neutral.600"), dark: foundation("neutral.400"), token: "semantic.text-icon.muted", description: "Low-emphasis metadata, hints, and non-critical information."),
        Self(foundation("neutral.700"), dark: foundation("neutral.300"), token: "semantic.text-icon.secondary", description: "Supporting text and icons with reduced prominence."),
        Self(foundation("green.800"), dark: foundation("green.400"), token: "semantic.text-icon.success", description: "Successful states, confirmations, and positive outcomes."),
        Self(foundation("yellow.900"), dark: foundation("yellow.200"), token: "semantic.text-icon.warning", description: "Cautionary information that may require attention."),
        Self(foundation("yellow.400"), dark: foundation("yellow.100"), token: "semantic.warning.default", description: "Applied sparingly to show warning feedback/status."),
        Self(foundation("yellow.500"), dark: foundation("yellow.200"), token: "semantic.warning.hover", description: "Applied sparingly to show warning feedback/status."),
        Self(foundation("yellow.600"), dark: foundation("yellow.300"), token: "semantic.warning.pressed", description: "Applied sparingly to show warning feedback/status."),
        Self(foundation("yellow.050"), dark: foundation("yellow.950"), token: "semantic.warning.soft", description: "Applied sparingly to show warning feedback/status.")
    ]

    /// Resolves a foundation token such as `blue.700`. The names are fixed, so a miss is a programmer error caught by the unit tests.
    private static func foundation(_ token: String) -> FoundationColor {
        guard let color: FoundationColor = FoundationColor.named(token) else {
            preconditionFailure("Unknown foundation color: \(token)")
        }
        return color
    }
}
