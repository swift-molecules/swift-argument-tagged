// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-argument-tagged",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Argument Tagged",
            targets: ["Argument Tagged"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-argument.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Argument Tagged",
            dependencies: [
                .product(name: "Argument", package: "swift-argument"),
                .product(name: "Argument Option", package: "swift-argument"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .testTarget(
            name: "Argument Tagged Tests",
            dependencies: [
                .product(name: "Argument", package: "swift-argument"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(
                    name: "Tagged Standard Library Integration",
                    package: "swift-tagged"
                ),
            ],
            path: "Tests/Argument Tagged Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
