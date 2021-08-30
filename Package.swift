// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Casimir",
    platforms: [
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "Casimir",
            targets: ["Casimir"]
        ),
    ],
    targets: [
        .target(
            name: "Casimir",
            dependencies: []
        ),
        .testTarget(
            name: "CasimirTests",
            dependencies: ["Casimir"]
        )
    ]
)
