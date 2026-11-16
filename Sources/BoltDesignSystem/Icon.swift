// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

/// A Bolt icon, bundled as a custom SF Symbol.
///
/// Names mirror https://bolt.thunderbird.net/8b179dbfd/p/58d408-icons
///
/// Every symbol uses the same scale per Bolt pixel, so a 16px icon such as ``add`` is two thirds the size of a 24px icon at the same font size.
/// Two-tone icons render hierarchically by default; forcing monochrome rendering fills them solid.
public enum Icon: String, CaseIterable, CustomStringConvertible, Identifiable, Sendable {
    case add
    case addressBook = "address-book"
    case addressBookLock = "address-book-lock"
    case addressBookNew = "address-book-new"
    case addressBookSave = "address-book-save"
    case addressBookSearch = "address-book-search"
    case appAppointment = "app-appointment"
    case appMail = "app-mail"
    case appSend = "app-send"

    /// Name of the symbol in the package's asset catalog.
    public var name: String { rawValue }

    // MARK: CustomStringConvertible
    public var description: String { rawValue }

    // MARK: Identifiable
    public var id: String { rawValue }
}
