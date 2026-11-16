// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Testing

struct ShadowTests {
    @Test func allCases() {
        #expect(Shadow.allCases.map(\.level) == [0, 1, 2, 3, 4, 5])
        #expect(Shadow.allCases.map(\.id) == ["shadow.0", "shadow.1", "shadow.2", "shadow.3", "shadow.4", "shadow.5"])
        #expect(Shadow.level0.layers.isEmpty)
        #expect(Shadow.allCases.dropFirst().allSatisfy { $0.layers.count == 2 })
    }

    // Values mirror https://bolt.thunderbird.net/8b179dbfd/p/711eb4-shadow
    @Test func values() {
        #expect(Shadow.level1.layers == [Shadow.Layer(x: 0.0, y: 2.0, blur: 4.0, spread: 1.0, opacity: 0.04), Shadow.Layer(x: 0.0, y: 0.0, blur: 2.0, spread: 0.0, opacity: 0.1)])
        #expect(Shadow.level3.layers.first == Shadow.Layer(x: 0.0, y: 6.0, blur: 10.0, spread: 2.0, opacity: 0.08))
        #expect(Shadow.level5.layers.last == Shadow.Layer(x: 0.0, y: 3.0, blur: 6.0, spread: 1.0, opacity: 0.12))
    }

    @Test func elevationIncreases() {
        let keyYOffsets: [Double] = Shadow.allCases.dropFirst().compactMap { $0.layers.first?.y }
        #expect(keyYOffsets == keyYOffsets.sorted())
    }

    @Test func radius() {
        #expect(Shadow.level1.layers[0].radius == 2.5)
        #expect(Shadow.level5.layers[0].radius == 8.5)
    }
}
