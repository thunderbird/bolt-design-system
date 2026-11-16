// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import SwiftUI

extension Image {
    public init(_ icon: Icon) {
        self.init(icon.name, bundle: .module)
    }
}

#Preview("Icon") {
    ScrollView {
        VStack(alignment: .leading, spacing: 16.0) {
            ForEach(Icon.allCases) { icon in
                Label {
                    Text(icon.description)
                } icon: {
                    Image(icon)
                }
            }
        }
        .font(.title)
        .padding()
    }
}
