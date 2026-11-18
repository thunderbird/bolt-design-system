// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Testing

struct SemanticColorTests {
    @Test func allCases() {
        #expect(SemanticColor.allCases(name: "accent").count == 6)
        #expect(SemanticColor.allCases(name: "accent", level: "ink").count == 1)
        #expect(SemanticColor.allCases(name: "accent").first?.token.description == "semantic.accent.blue")
        #expect(SemanticColor.allCases(name: "accent", level: "ink").first?.token.description == "semantic.accent.ink")
        #expect(SemanticColor.allCases(name: "accent").last?.token.description == "semantic.accent.teal")
        #expect(SemanticColor.allCases(name: "critical").count == 4)
        #expect(SemanticColor.allCases(name: "critical", level: "hover").count == 1)
        #expect(SemanticColor.allCases(name: "critical").first?.token.description == "semantic.critical.default")
        #expect(SemanticColor.allCases(name: "critical", level: "hover").first?.token.description == "semantic.critical.hover")
        #expect(SemanticColor.allCases(name: "critical").last?.token.description == "semantic.critical.soft")
        #expect(SemanticColor.allCases(name: "primary").count == 4)
        #expect(SemanticColor.allCases(name: "primary", level: "pressed").count == 1)
        #expect(SemanticColor.allCases(name: "primary").first?.token.description == "semantic.primary.default")
        #expect(SemanticColor.allCases(name: "primary", level: "pressed").first?.token.description == "semantic.primary.pressed")
        #expect(SemanticColor.allCases(name: "primary").last?.token.description == "semantic.primary.soft")
        #expect(SemanticColor.allCases(name: "success").count == 4)
        #expect(SemanticColor.allCases(name: "success", level: "hover").count == 1)
        #expect(SemanticColor.allCases(name: "success").first?.token.description == "semantic.success.default")
        #expect(SemanticColor.allCases(name: "success", level: "hover").first?.token.description == "semantic.success.hover")
        #expect(SemanticColor.allCases(name: "success").last?.token.description == "semantic.success.soft")
        #expect(SemanticColor.allCases(name: "surface").count == 7)
        #expect(SemanticColor.allCases(name: "surface", level: "deep").count == 1)
        #expect(SemanticColor.allCases(name: "surface").first?.token.description == "semantic.surface.base")
        #expect(SemanticColor.allCases(name: "surface", level: "deep").first?.token.description == "semantic.surface.deep")
        #expect(SemanticColor.allCases(name: "surface").last?.token.description == "semantic.surface.subtle")
        #expect(SemanticColor.allCases(name: "text-icon").count == 10)
        #expect(SemanticColor.allCases(name: "text-icon", level: "critical").count == 1)
        #expect(SemanticColor.allCases(name: "text-icon").first?.token.description == "semantic.text-icon.base")
        #expect(SemanticColor.allCases(name: "text-icon", level: "critical").first?.token.description == "semantic.text-icon.critical")
        #expect(SemanticColor.allCases(name: "text-icon").last?.token.description == "semantic.text-icon.warning")
        #expect(SemanticColor.allCases(name: "warning").count == 4)
        #expect(SemanticColor.allCases(name: "warning", level: "hover").count == 1)
        #expect(SemanticColor.allCases(name: "warning").first?.token.description == "semantic.warning.default")
        #expect(SemanticColor.allCases(name: "warning", level: "hover").first?.token.description == "semantic.warning.hover")
        #expect(SemanticColor.allCases(name: "warning").last?.token.description == "semantic.warning.soft")
    }
}

extension SemanticColorTests {
    @Test func tokensAreUnique() {
        let ids: [String] = SemanticColor.allCases.map(\.id)
        #expect(Set(ids).count == ids.count)
        #expect(ids.count == 39)
    }

    // Values mirror https://bolt.thunderbird.net/8b179dbfd/p/61e4c7-color
    @Test func values() {
        func hex(_ color: SemanticColor) -> (any: Int, dark: Int?) {
            (color.color.any.hex, color.color.dark?.hex)
        }
        #expect(hex(.primary(.default)) == (0x1373D9, 0x75B4E6))
        #expect(hex(.primary(.hover)) == (0x175FB6, 0x5FA0D6))
        #expect(hex(.primary(.pressed)) == (0x19518F, 0x4C8CC2))
        #expect(hex(.success(.pressed)) == (0x194E2C, 0x81D4B5))
        #expect(hex(.textIcon(.brand)) == (0x0B5CBD, 0x5FA6E8))
        #expect(hex(.textIcon(.highlight)) == (0x1373D9, 0x58C9FF))
        #expect(hex(.accent(.teal)) == (0x25A6A0, 0xA3ECE3))
        #expect(hex(.surface(.base)) == (0xFCFCFD, 0x18181B))
    }

    @Test func tokens() {
        #expect(SemanticColor.surface(.borderIntense).id == "semantic.surface.border-intense")
        #expect(SemanticColor.textIcon(.baseInverted).id == "semantic.text-icon.base-inverted")
        #expect(SemanticColor.warning(.default).id == "semantic.warning.default")
    }

    @Test func everyColorHasADarkVariant() {
        #expect(SemanticColor.allCases.filter { $0.color.dark == nil }.isEmpty)
    }
}
