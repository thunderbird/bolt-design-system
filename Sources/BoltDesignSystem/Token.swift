// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

public enum TokenError: Error, CustomStringConvertible {
    case jsonObjectWrongType
    case emptyTokenString

    // MARK: CustomStringConvertible
    public var description: String {
        switch self {
        case .jsonObjectWrongType: "JSON object wrong type"
        case .emptyTokenString: "Empty token string"
        }
    }
}

public struct Token: CustomStringConvertible, ExpressibleByStringLiteral {
    public static let separator: String = "."
    public let components: [String]
    public var name: String { components.count > 1 ? components[1] : components[0] }
    public var tokenSet: String? { components.count > 1 ? components[0] : nil }
    public var level: String? { components.count > 2 ? components[2] : nil }

    public init(description: String) throws {
        let description: String = description.normalizedTokenString
        guard !description.isEmpty else {
            throw TokenError.emptyTokenString
        }
        components = description.components(separatedBy: Self.separator)
        self.description = description
    }

    // MARK: CustomStringConvertible
    public let description: String

    // MARK: ExpressibleByStringLiteral
    public init(stringLiteral value: String) {
        let value: String = value.normalizedTokenString
        try! self.init(description: !value.isEmpty ? value : UUID().uuidString.lowercased())
    }
}

private extension String {
    var normalizedTokenString: Self {
        trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "{", with: "")
            .replacingOccurrences(of: "}", with: "")
    }
}
