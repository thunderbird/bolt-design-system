// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

public struct SemanticColor: CustomStringConvertible, Identifiable {
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
    static func allCases(name: String?, level: String? = nil) throws -> [Self] {
        let tokens: [String: Any] = try Bundle.module.tokens
        let foundationColors: [FoundationColor] = FoundationColor.allCases
        guard let any: [String: [String: [String: String]]] = tokens["\(String.semantic)/light"] as? [String: [String: [String: String]]],
            let dark: [String: [String: [String: String]]] = tokens["\(String.semantic)/dark"] as? [String: [String: [String: String]]]
        else {
            throw TokenError.jsonObjectWrongType
        }
        var colors: [Self] = []
        for name in any.keys {
            let dictionary: (any: [String: [String: String]], dark: [String: [String: String]]?) = (any[name]!, dark[name])
            for level in dictionary.any.keys {
                let anyValue: String = dictionary.any[level]?["$value"] ?? ""
                let anyColor: FoundationColor = foundationColors.filter { "{\($0.token)}" == anyValue }[0]
                let darkValue: String = dictionary.dark?[level]?["$value"] ?? ""
                let darkColor: FoundationColor? = foundationColors.filter { "{\($0.token)}" == darkValue }.first
                let token: Token = Token(stringLiteral: "\(String.semantic).\(name).\(level)")
                let description = dictionary.any[level]?["$description"] ?? ""
                colors.append(Self(anyColor, dark: darkColor, token: token, description: description))
            }
        }
        colors = colors.sorted { $0.id < $1.id }
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
    static let semantic: Self = "semantic"
}
