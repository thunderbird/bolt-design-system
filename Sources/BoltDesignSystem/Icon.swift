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
    case appSwitcher = "app-switcher"
    case appearance
    case archive
    case arrowDown = "arrow-down"
    case arrowLeft = "arrow-left"
    case arrowRight = "arrow-right"
    case arrowUp = "arrow-up"
    case arrowOutlineDown = "arrow-outline-down"
    case arrowOutlineLeft = "arrow-outline-left"
    case arrowOutlineRight = "arrow-outline-right"
    case arrowOutlineUp = "arrow-outline-up"
    case attachment
    case bug
    case calendar
    case calendarDateTime = "calendar-date-time"
    case calendarLock = "calendar-lock"
    case calendarNet = "calendar-net"
    case calendarSave = "calendar-save"
    case calendarSearch = "calendar-search"
    case calendarToday = "calendar-today"
    case chat
    case chatLock = "chat-lock"
    case chatNew = "chat-new"
    case chatSave = "chat-save"
    case chatSearch = "chat-search"
    case check
    case chevronDown = "chevron-down"
    case chevronLeft = "chevron-left"
    case chevronRight = "chevron-right"
    case chevronUp = "chevron-up"
    case circleArrowLeft = "circle-arrow-left"
    case circleArrowRight = "circle-arrow-right"

    /// Name of the symbol in the package's asset catalog.
    public var name: String { rawValue }

    // MARK: CustomStringConvertible
    public var description: String { rawValue }

    // MARK: Identifiable
    public var id: String { rawValue }
}
