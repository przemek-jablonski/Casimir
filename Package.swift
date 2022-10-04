// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Casimir",
    platforms: [
        .iOS(.v15),
        .watchOS(.v8),
        .tvOS(.v15),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "Casimir",
            targets: ["Casimir"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/CombineCommunity/CombineExt", exact: "1.8.0"),
        .package(url: "https://github.com/tcldr/Entwine.git", exact: "0.9.1"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", exact: "1.9.6"),
    ],
    targets: [
        .target(
            name: "Casimir",
            dependencies: [
                .product(name: "CombineExt", package: "CombineExt"),
                "SwiftyBeaver",
                .product(name: "EntwineTest", package: "Entwine")
            ]
        ),
        .testTarget(
            name: "CasimirTests",
            dependencies: ["Casimir"]
        )
    ]
)
