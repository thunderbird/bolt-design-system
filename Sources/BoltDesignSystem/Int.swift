// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

extension Int {
    var red: Double { Double((self & 0xFF0000) >> 16) / 255.0 }
    var green: Double { Double((self & 0x00FF00) >> 8) / 255.0 }
    var blue: Double { Double(self & 0x00FF) / 255.0 }

    init(_ components: [Double]? = nil) {
        switch (components ?? []).count {
        case 4: // RGB
            self = (Int(components![0] * 255.0) << 16) + (Int(components![1] * 255.0) << 8) + (Int(components![2] * 255.0) << 0)
        case 2: // Grayscale
            self = (Int(components![0] * 255.0) << 16) + (Int(components![0] * 255.0) << 8) + (Int(components![0] * 255.0) << 0)
        default:
            self = 0
        }
    }
}
