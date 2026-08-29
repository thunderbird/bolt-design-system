// swift-tools-version: 6.3

import PackageDescription

let package: Package = Package(
    name: "BoltDesignSystem",
    platforms: [
        .iOS(.v18),
        .watchOS(.v11),
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "BoltDesignSystem",
            targets: [
                "BoltDesignSystem"
            ])
    ],
    targets: [
        .target(
            name: "BoltDesignSystem",
            resources: [
                .process("../../packages/bolt-design-tokens/tokens/tokens.json")
            ]),
        .testTarget(
            name: "BoltDesignSystemTests",
            dependencies: [
                "BoltDesignSystem"
            ])
    ],
    swiftLanguageModes: [.v6]
)
