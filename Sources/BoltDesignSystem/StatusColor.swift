// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

/// A Bolt status color token: info, success, warning and error, each with a base color, a color for content on it, a container color and a color for content in the container.
///
/// Values mirror https://bolt.thunderbird.net/8b179dbfd/p/824dfe-design-tokens, which is still in progress and publishes light mode only,
/// so these colors don't change in dark mode.
public struct StatusColor: CustomStringConvertible, Identifiable, Sendable {
    public let token: Token
    public let hex: Int
    public let usage: String

    public init(hex: Int, token: Token, usage: String = "") {
        self.token = token
        self.hex = hex
        self.usage = usage
        self.description = "\(token) (\(String(hex: hex)))\(usage.isEmpty ? "" : ": \(usage)")"
    }

    // MARK: CustomStringConvertible
    public let description: String

    // MARK: Identifiable
    public var id: String { token.description }
}

extension StatusColor: CaseIterable {
    public static let info: Self = Self(hex: 0x004F9B, token: "status.info", usage: "Buttons, chips, icons")
    public static let infoContainer: Self = Self(hex: 0xF0F8FF, token: "status.infoContainer", usage: "Banners, cards, backgrounds")
    public static let onInfo: Self = Self(hex: 0xFFFFFF, token: "status.onInfo", usage: "Text/icon in filled components")
    public static let onInfoContainer: Self = Self(hex: 0x004F9B, token: "status.onInfoContainer", usage: "Text/icons inside containers")
    public static let success: Self = Self(hex: 0x194E2C, token: "status.success", usage: "Icons, highlights, action emphasis")
    public static let onSuccess: Self = Self(hex: 0xFFFFFF, token: "status.onSuccess", usage: "Text/icon in filled components")
    public static let successContainer: Self = Self(hex: 0xF4F9F4, token: "status.successContainer", usage: "Background of banners, badges, cards")
    public static let onSuccessContainer: Self = Self(hex: 0x194E2C, token: "status.onSuccessContainer", usage: "Text/icons inside containers")
    public static let warning: Self = Self(hex: 0x713F12, token: "status.warning", usage: "Icons, highlights, action emphasis")
    public static let onWarning: Self = Self(hex: 0xFFFFFF, token: "status.onWarning", usage: "Text/icon in filled components")
    public static let warningContainer: Self = Self(hex: 0xFEFAE8, token: "status.warningContainer", usage: "Background of banners, badges, cards")
    public static let onWarningContainer: Self = Self(hex: 0x713F12, token: "status.onWarningContainer", usage: "Text/icons inside containers")
    public static let error: Self = Self(hex: 0x7F1D1D, token: "status.error", usage: "Icons, highlights, action emphasis")
    public static let onError: Self = Self(hex: 0xFFFFFF, token: "status.onError", usage: "Text/icon in filled components")
    public static let errorContainer: Self = Self(hex: 0xFEF2F2, token: "status.errorContainer", usage: "Background of banners, badges, cards")
    public static let onErrorContainer: Self = Self(hex: 0x7F1D1D, token: "status.onErrorContainer", usage: "Text/icons inside containers")

    // MARK: CaseIterable
    /// In the order of Bolt's token table.
    public static let allCases: [Self] = [
        info, infoContainer, onInfo, onInfoContainer,
        success, onSuccess, successContainer, onSuccessContainer,
        warning, onWarning, warningContainer, onWarningContainer,
        error, onError, errorContainer, onErrorContainer
    ]
}
