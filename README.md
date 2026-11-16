# Bolt Design System

Welcome to Bolt, Thunderbird's new design system. Bolt is here to ensure design consistency across desktop, mobile and web, while making it easy to onboard for contributors both internal and external.

This repository will soon contain [design tokens](https://www.w3.org/community/design-tokens/) that are to be consumed by another application. These applications can be used to convert design tokens to css, or import various tokens into design tools. 

## Swift package

`BoltDesignSystem` is a Swift package for iOS, macOS and watchOS. Add this repository as a package dependency, then `import BoltDesignSystem`.

* **Colors:** `FoundationColor` (the palette) and `SemanticColor` (light and dark pairs), used as `Color(_:)`. Values mirror the [color page](https://bolt.thunderbird.net/8b179dbfd/p/61e4c7-color).
* **Shadows:** `Shadow.level0` to `Shadow.level5`, applied with `.shadow(_:)`. Bolt doesn't use shadows in dark mode, so the modifier does nothing there. Values mirror the [shadow page](https://bolt.thunderbird.net/8b179dbfd/p/711eb4-shadow).
* **Icons:** `Icon` cases are custom SF Symbols, used as `Image(_:)`. They scale with the font and take the foreground style. Two-tone icons render hierarchically by default.

Run the tests with `swift test`.

## Releases

We're still working out policy and process behind releasing and versioning these tokens, so if anything seems unclear don't hesitate to ask!

## Contributing

Currently discussion occurs within the [Bolt Design System matrix room](https://matrix.to/#/#bolt-design-system:mozilla.org) `#bolt-design-system:mozilla.org`.
