// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Testing

struct FoundationColorTests {
    @Test func allCases() {
        #expect(FoundationColor.allCases(name: "blue").count == 10)
        #expect(FoundationColor.allCases(name: "blue", level: "700").count == 1)
        #expect(FoundationColor.allCases(name: "blue").first?.token.description == "foundation.blue.050")
        #expect(FoundationColor.allCases(name: "blue", level: "700").first?.token.description == "foundation.blue.700")
        #expect(FoundationColor.allCases(name: "blue").last?.token.description == "foundation.blue.950")
        #expect(FoundationColor.allCases(name: "green").count == 9)
        #expect(FoundationColor.allCases(name: "green").first?.token.description == "foundation.green.050")
        #expect(FoundationColor.allCases(name: "green").last?.token.description == "foundation.green.950")
        #expect(FoundationColor.allCases(name: "ink").count == 2)
        #expect(FoundationColor.allCases(name: "ink").first?.token.description == "foundation.ink.300")
        #expect(FoundationColor.allCases(name: "ink").last?.token.description == "foundation.ink.700")
        #expect(FoundationColor.allCases(name: "neutral").count == 20)
        #expect(FoundationColor.allCases(name: "neutral").first?.token.description == "foundation.neutral.000")
        #expect(FoundationColor.allCases(name: "neutral").last?.token.description == "foundation.neutral.975")
        #expect(FoundationColor.allCases(name: "orange").count == 2)
        #expect(FoundationColor.allCases(name: "orange").first?.token.description == "foundation.orange.200")
        #expect(FoundationColor.allCases(name: "orange").last?.token.description == "foundation.orange.500")
        #expect(FoundationColor.allCases(name: "pink").count == 2)
        #expect(FoundationColor.allCases(name: "pink").first?.token.description == "foundation.pink.200")
        #expect(FoundationColor.allCases(name: "pink").last?.token.description == "foundation.pink.500")
        #expect(FoundationColor.allCases(name: "purple").count == 9)
        #expect(FoundationColor.allCases(name: "purple").first?.token.description == "foundation.purple.050")
        #expect(FoundationColor.allCases(name: "purple").last?.token.description == "foundation.purple.950")
        #expect(FoundationColor.allCases(name: "red").count == 10)
        #expect(FoundationColor.allCases(name: "red").first?.token.description == "foundation.red.100")
        #expect(FoundationColor.allCases(name: "red").last?.token.description == "foundation.red.950")
        #expect(FoundationColor.allCases(name: "teal").count == 2)
        #expect(FoundationColor.allCases(name: "teal").first?.token.description == "foundation.teal.200")
        #expect(FoundationColor.allCases(name: "teal").last?.token.description == "foundation.teal.500")
        #expect(FoundationColor.allCases(name: "user-accent").count == 8)
        #expect(FoundationColor.allCases(name: "user-accent", level: "graphite").count == 1)
        #expect(FoundationColor.allCases(name: "user-accent").first?.token.description == "foundation.user-accent.blue")
        #expect(FoundationColor.allCases(name: "user-accent", level: "graphite").first?.token.description == "foundation.user-accent.graphite")
        #expect(FoundationColor.allCases(name: "user-accent").last?.token.description == "foundation.user-accent.yellow")
        #expect(FoundationColor.allCases(name: "yellow").count == 9)
        #expect(FoundationColor.allCases(name: "yellow").first?.token.description == "foundation.yellow.050")
        #expect(FoundationColor.allCases(name: "yellow").last?.token.description == "foundation.yellow.950")
    }
}

extension FoundationColorTests {
    @Test func tokensAreUnique() {
        let ids: [String] = FoundationColor.allCases.map(\.id)
        #expect(Set(ids).count == ids.count)
        #expect(ids.count == 83)
    }

    @Test func userAccentRed() {
        #expect(FoundationColor(.userAccentRed).hex == 0xE74642)
    }

    @Test func name() {
        #expect(FoundationColor(.blue700).hex == 0x1373D9)
        #expect(FoundationColor(.blue700).token.description == "foundation.blue.700")
        #expect(FoundationColor(.userAccentRed).token.description == "foundation.user-accent.red")
        #expect(FoundationColor.allCases.map(\.id) == FoundationColor.Name.allCases.map { "foundation.\($0.rawValue)" })
    }
}
