// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

/// A Bolt elevation shadow, from `level0` (flat) to `level5` (highest overlay).
///
/// Every level combines a larger *key* shadow, which indicates distance from the surface, with a tight *ambient* shadow, which defines the component boundary.
/// Values mirror https://bolt.thunderbird.net/8b179dbfd/p/711eb4-shadow and use CSS `box-shadow` semantics.
public struct Shadow: CustomStringConvertible, Identifiable, Sendable {

    /// One layer of a shadow. The color is always black at `opacity`.
    public struct Layer: Sendable, Equatable {
        public let x: Double
        public let y: Double
        public let blur: Double
        public let spread: Double
        public let opacity: Double

        /// SwiftUI has no spread and its radius is half of a CSS blur, so this approximates `box-shadow` with `(blur + spread) / 2`.
        public var radius: Double { (blur + spread) / 2.0 }
    }

    public let token: Token
    public let level: Int
    public let layers: [Layer]
    public let usage: String

    /// Layers are ordered key shadow first, then ambient shadow.
    public init(level: Int, layers: [Layer] = [], usage: String = "") {
        self.token = Token(stringLiteral: "shadow.\(level)")
        self.level = level
        self.layers = layers
        self.usage = usage
        self.description = "\(token)\(usage.isEmpty ? "" : ": \(usage)")"
    }

    // MARK: CustomStringConvertible
    public let description: String

    // MARK: Identifiable
    public var id: String { token.description }
}

extension Shadow: CaseIterable {
    public static let level0: Self = Self(level: 0, usage: "Flat surface")
    public static let level1: Self = Self(
        level: 1,
        layers: [
            Layer(x: 0.0, y: 2.0, blur: 4.0, spread: 1.0, opacity: 0.04),
            Layer(x: 0.0, y: 0.0, blur: 2.0, spread: 0.0, opacity: 0.1)
        ],
        usage: "Subtle separation for cards and contained sections")
    public static let level2: Self = Self(
        level: 2,
        layers: [
            Layer(x: 0.0, y: 4.0, blur: 8.0, spread: 1.5, opacity: 0.06),
            Layer(x: 0.0, y: 0.0, blur: 3.0, spread: 0.25, opacity: 0.11)
        ],
        usage: "Light lift for raised panels and floating controls")
    public static let level3: Self = Self(
        level: 3,
        layers: [
            Layer(x: 0.0, y: 6.0, blur: 10.0, spread: 2.0, opacity: 0.08),
            Layer(x: 0.0, y: 1.0, blur: 4.0, spread: 0.5, opacity: 0.12)
        ],
        usage: "Clear separation for dropdown menus and popovers")
    public static let level4: Self = Self(
        level: 4,
        layers: [
            Layer(x: 0.0, y: 8.0, blur: 12.0, spread: 2.5, opacity: 0.1),
            Layer(x: 0.0, y: 2.0, blur: 5.0, spread: 0.75, opacity: 0.12)
        ],
        usage: "Strong separation for dialogs and modal sheets")
    public static let level5: Self = Self(
        level: 5,
        layers: [
            Layer(x: 0.0, y: 10.0, blur: 14.0, spread: 3.0, opacity: 0.12),
            Layer(x: 0.0, y: 3.0, blur: 6.0, spread: 1.0, opacity: 0.12)
        ],
        usage: "Highest elevation for temporary overlays above other elevated content")

    // MARK: CaseIterable
    public static let allCases: [Self] = [level0, level1, level2, level3, level4, level5]
}
