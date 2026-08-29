// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Testing

struct TokenTests {
    @Test func name() {
        #expect(Token(" foundation.yellow.100   ").name == "yellow")
        #expect(Token("orange ").name == "orange")
        #expect(Token("foundation.red").name == "red")
    }

    @Test func tokenSet() {
        #expect(Token(" foundation.yellow.100   ").tokenSet == "foundation")
        #expect(Token("orange ").tokenSet == nil)
        #expect(Token("foundation.red").tokenSet == "foundation")
    }

    @Test func level() {
        #expect(Token(" foundation.yellow.100   ").level == "100")
        #expect(Token("orange ").level == nil)
        #expect(Token("foundation.red").level == nil)
    }

    @Test func descriptionInit() throws {
        #expect(try Token(description: " foundation.yellow.100   ").description == "foundation.yellow.100")
        #expect(try Token(description: "foundation.yellow.100 ").components == ["foundation", "yellow", "100"])
        #expect(try Token(description: "orange ").description == "orange")
        #expect(try Token(description: " orange").components == ["orange"])
        #expect(try Token(description: "foundation.red").description == "foundation.red")
        #expect(try Token(description: "foundation.red").components == ["foundation", "red"])
        #expect(throws: TokenError.empty) {
            try Token(description: "    ")
        }
        #expect(throws: TokenError.empty) {
            try Token(description: "")
        }
    }

    // MARK: ExpressibleByStringLiteral
    @Test func stringLiteralInit() {
        #expect(Token(" foundation.yellow.100   ").description == "foundation.yellow.100")
        #expect(Token("orange ").description == "orange")
        #expect(Token("foundation.red").description == "foundation.red")
        #expect(Token("").description.isEmpty == false)
    }
}
