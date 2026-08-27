// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

extension Bundle {
    var tokensData: Data {
        get throws { try Data(contentsOf: try tokensURL) }
    }

    var tokensURL: URL {
        get throws { try url(forResource: "tokens.json") }
    }

    func url(forResource name: String) throws -> URL {
        guard let url: URL = url(forResource: name, withExtension: nil) else {
            throw URLError(.fileDoesNotExist)
        }
        return url
    }
}
