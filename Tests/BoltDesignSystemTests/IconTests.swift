// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

@testable import BoltDesignSystem
import Foundation
import Testing

#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif

struct IconTests {
    @Test func allCases() {
        #expect(Icon.allCases.count == 193)
        #expect(Set(Icon.allCases.map(\.name)).count == Icon.allCases.count)
        #expect(Icon.addressBookLock.name == "address-book-lock")
        #expect(Icon.add.description == "add")
        #expect(Icon.appMail.id == "app-mail")
    }

    // Every case resolves to a symbol in the asset catalog
    @Test(arguments: Icon.allCases) func symbol(_ icon: Icon) {
        #if canImport(AppKit)
        #expect(Bundle.module.image(forResource: icon.name) != nil)
        #elseif canImport(UIKit)
        #expect(UIImage(named: icon.name, in: .module, with: nil) != nil)
        #endif
    }
}
