// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Foundation
import Testing

struct BundleTests {
    @Test func tokens() throws {
        #expect(try Bundle.module.tokens.keys.contains("foundation") == true)
    }

    @Test func tokensData() throws {
        #expect(try Bundle.module.tokensData.count > 10_000)
    }

    @Test func tokensURL() throws {
        #expect(try Bundle.module.tokensURL.absoluteString.hasSuffix(".bundle/tokens.json") == true)
    }

    @Test func urlForResource() throws {
        #expect(try Bundle.module.url(forResource: "tokens.json").absoluteString.hasSuffix(".bundle/tokens.json") == true)
        #expect(throws: URLError.self) {
            try Bundle.module.url(forResource: "foo.xml")
        }
    }
}
