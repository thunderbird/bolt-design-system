// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Testing

struct StatusColorTests {
    @Test func allCases() {
        #expect(StatusColor.allCases.count == 16)
        #expect(Set(StatusColor.allCases.map(\.id)).count == 16)
        #expect(StatusColor.allCases.first?.id == "status.info")
        #expect(StatusColor.allCases.last?.id == "status.onErrorContainer")
    }

    // Values mirror https://bolt.thunderbird.net/8b179dbfd/p/824dfe-design-tokens
    @Test func values() {
        #expect(StatusColor.info.hex == 0x004F9B)
        #expect(StatusColor.infoContainer.hex == 0xF0F8FF)
        #expect(StatusColor.successContainer.hex == 0xF4F9F4)
        #expect(StatusColor.warning.hex == 0x713F12)
        #expect(StatusColor.errorContainer.hex == 0xFEF2F2)
        #expect(StatusColor.onError.hex == 0xFFFFFF)
    }

    // Each on-container color is the base color of its family
    @Test func onContainerMatchesBase() {
        #expect(StatusColor.onInfoContainer.hex == StatusColor.info.hex)
        #expect(StatusColor.onSuccessContainer.hex == StatusColor.success.hex)
        #expect(StatusColor.onWarningContainer.hex == StatusColor.warning.hex)
        #expect(StatusColor.onErrorContainer.hex == StatusColor.error.hex)
    }
}
