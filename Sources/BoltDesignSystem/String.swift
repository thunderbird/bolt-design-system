// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

extension String {

    // Encode and decode RGB color values
    var hex: Int {
        var hex: UInt64 = 0
        Scanner(string: normalizedHexString).scanHexInt64(&hex)
        return Int(hex)
    }

    init(hex: Int) {
        self = "#\(Self(hex, radix: 16).normalizedHexString)"
    }

    private var normalizedHexString: Self {
        let string: Substring = uppercased().replacingOccurrences(of: "[^A-F0-9]+", with: "", options: .regularExpression).prefix(6)
        switch string.count {
        case 3:
            return string.map { character in
                return Self(repeating: character, count: 2)
            }.joined()
        case 1:
            return Self(repeating: string.first!, count: 6)
        default:
            return "\(Self(repeating: "0", count: 6 - string.count))\(string)"
        }
    }
}
