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
    case chevronOutlineDown = "chevron-outline-down"
    case chevronOutlineLeft = "chevron-outline-left"
    case chevronOutlineRight = "chevron-outline-right"
    case chevronOutlineUp = "chevron-outline-up"
    case circleAdd = "circle-add"
    case circleDown = "circle-down"
    case circleLeft = "circle-left"
    case circleRight = "circle-right"
    case circleUp = "circle-up"
    case circleCheck = "circle-check"
    case circleChevronDown = "circle-chevron-down"
    case circleChevronLeft = "circle-chevron-left"
    case circleChevronRight = "circle-chevron-right"
    case circleChevronUp = "circle-chevron-up"
    case circleClock = "circle-clock"
    case circleClose = "circle-close"
    case circleCritical = "circle-critical"
    case circleError = "circle-error"
    case circleIndicator = "circle-indicator"
    case circleInfo = "circle-info"
    case circleQuestion = "circle-question"
    case circleSubtract = "circle-subtract"
    case close
    case cloudDownload = "cloud-download"
    case compose
    case confetti
    case contact
    case contactLock = "contact-lock"
    case contactNew = "contact-new"
    case contactSave = "contact-save"
    case contactSearch = "contact-search"
    case contribute
    case copy
    case cut
    case dashboard
    case densityCompact = "density-compact"
    case densityDefault = "density-default"
    case densityRelaxed = "density-relaxed"
    case desktop
    case devices
    case donate
    case download
    case drag
    case emailAlias = "email-alias"
    case eventContinue = "event-continue"
    case eventEnd = "event-end"
    case eventStart = "event-start"
    case export
    case file
    case fileDraft = "file-draft"
    case fileLock = "file-lock"
    case fileNew = "file-new"
    case fileSave = "file-save"
    case fileSearch = "file-search"
    case filter
    case folder
    case folderLock = "folder-lock"
    case folderNew = "folder-new"
    case folderRss = "folder-rss"
    case folderSave = "folder-save"
    case folderSearch = "folder-search"
    case font
    case forward
    case forwardAll = "forward-all"
    case globe
    case globeLock = "globe-lock"
    case globeNew = "globe-new"
    case globeSave = "globe-save"
    case globeSearch = "globe-search"
    case guestAttending = "guest-attending"
    case guestDeclined = "guest-declined"
    case home
    case idea
    case image
    case circleArrowLeft = "circle-arrow-left"
    case circleArrowRight = "circle-arrow-right"

    /// Name of the symbol in the package's asset catalog.
    public var name: String { rawValue }

    // MARK: CustomStringConvertible
    public var description: String { rawValue }

    // MARK: Identifiable
    public var id: String { rawValue }
}
