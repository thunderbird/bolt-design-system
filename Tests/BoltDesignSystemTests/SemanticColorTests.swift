// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Testing

struct SemanticColorTests {
    @Test func allCases() throws {
        #expect(try SemanticColor.allCases(name: "accent").count == 6)
        #expect(try SemanticColor.allCases(name: "accent", level: "ink").count == 1)
        #expect(try SemanticColor.allCases(name: "accent").first?.token.description == "semantic.accent.blue")
        #expect(try SemanticColor.allCases(name: "accent", level: "ink").first?.token.description == "semantic.accent.ink")
        #expect(try SemanticColor.allCases(name: "accent").last?.token.description == "semantic.accent.purple")
        #expect(try SemanticColor.allCases(name: "critical").count == 4)
        #expect(try SemanticColor.allCases(name: "critical", level: "hover").count == 1)
        #expect(try SemanticColor.allCases(name: "critical").first?.token.description == "semantic.critical.default")
        #expect(try SemanticColor.allCases(name: "critical", level: "hover").first?.token.description == "semantic.critical.hover")
        #expect(try SemanticColor.allCases(name: "critical").last?.token.description == "semantic.critical.soft")
        #expect(try SemanticColor.allCases(name: "primary").count == 4)
        #expect(try SemanticColor.allCases(name: "primary", level: "pressed").count == 1)
        #expect(try SemanticColor.allCases(name: "primary").first?.token.description == "semantic.primary.default")
        #expect(try SemanticColor.allCases(name: "primary", level: "pressed").first?.token.description == "semantic.primary.pressed")
        #expect(try SemanticColor.allCases(name: "primary").last?.token.description == "semantic.primary.soft")
        #expect(try SemanticColor.allCases(name: "success").count == 4)
        #expect(try SemanticColor.allCases(name: "success", level: "hover").count == 1)
        #expect(try SemanticColor.allCases(name: "success").first?.token.description == "semantic.success.default")
        #expect(try SemanticColor.allCases(name: "success", level: "hover").first?.token.description == "semantic.success.hover")
        #expect(try SemanticColor.allCases(name: "success").last?.token.description == "semantic.success.soft")
        #expect(try SemanticColor.allCases(name: "surface").count == 7)
        #expect(try SemanticColor.allCases(name: "surface", level: "deep").count == 1)
        #expect(try SemanticColor.allCases(name: "surface").first?.token.description == "semantic.surface.base")
        #expect(try SemanticColor.allCases(name: "surface", level: "deep").first?.token.description == "semantic.surface.deep")
        #expect(try SemanticColor.allCases(name: "surface").last?.token.description == "semantic.surface.subtle")
        #expect(try SemanticColor.allCases(name: "text-icon").count == 10)
        #expect(try SemanticColor.allCases(name: "text-icon", level: "critical").count == 1)
        #expect(try SemanticColor.allCases(name: "text-icon").first?.token.description == "semantic.text-icon.base")
        #expect(try SemanticColor.allCases(name: "text-icon", level: "critical").first?.token.description == "semantic.text-icon.critical")
        #expect(try SemanticColor.allCases(name: "text-icon").last?.token.description == "semantic.text-icon.warning")
        #expect(try SemanticColor.allCases(name: "warning").count == 4)
        #expect(try SemanticColor.allCases(name: "warning", level: "hover").count == 1)
        #expect(try SemanticColor.allCases(name: "warning").first?.token.description == "semantic.warning.default")
        #expect(try SemanticColor.allCases(name: "warning", level: "hover").first?.token.description == "semantic.warning.hover")
        #expect(try SemanticColor.allCases(name: "warning").last?.token.description == "semantic.warning.soft")
    }
}
