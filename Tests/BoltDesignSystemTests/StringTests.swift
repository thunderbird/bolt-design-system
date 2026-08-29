// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Testing

struct StringTests {
    @Test func hex() {
        #expect("#FFFFFF".hex == 0xFFFFFF)
        #expect("f3C".hex == 0xFF33CC)
        #expect("#ccc".hex == 0xCCCCCC)
        #expect("3".hex == 0x333333)
        #expect("".hex == 0x0)
    }

    @Test func hexInit() {
        #expect(String(hex: 0xFFFFFF) == "#FFFFFF")
        #expect(String(hex: 0xFF) == "#0000FF")
        #expect(String(hex: 0x0) == "#000000")
    }
}

