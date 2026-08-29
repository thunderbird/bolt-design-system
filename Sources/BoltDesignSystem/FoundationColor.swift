// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import SwiftUI

extension Color {
    public init(_ foundationColor: FoundationColor) {
        self.init(hex: foundationColor.hex)
    }

    init(hex: Int) {
        self.init(red: hex.red, green: hex.green, blue: hex.blue)
    }
}

#Preview(" Foundation Color") {
    ScrollView {
        VStack {
            ForEach(FoundationColor.allCases) {
                Color($0)
                    .frame(height: 44.0)
            }
        }
        .padding()
    }
}

public struct FoundationColor: CustomStringConvertible, Identifiable {
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
    static func allCases(name: String?, level: String? = nil) throws -> [Self] {
        let tokens: [String: Any] = try Bundle.module.tokens
        guard let tokens: [String: [String: [String: String]]] = tokens[.foundation] as? [String: [String: [String: String]]] else {
            throw DecodingError.typeMismatchJSONDictionary
        }
        var colors: [Self] = []
        for name in tokens.keys {
            let dictionary: [String: [String: String]] = tokens[name]!
            for level in dictionary.keys {
                let hex: String = dictionary[level]?["$value"] ?? ""
                let token: Token = Token(stringLiteral: "\(String.foundation).\(name).\(level)")
                let description = dictionary[level]?["$description"] ?? ""
                colors.append(Self(hex: hex, token: token, description: description))
            }
        }
        colors = colors.sorted { $0.token.description < $1.token.description }
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
    public static var allCases: [Self] { (try? allCases(name: nil)) ?? [] }
}

private extension String {
    static let foundation: Self = "foundation"
}
