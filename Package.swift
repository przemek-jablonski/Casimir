// swift-tools-version:5.5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Casimir",
    platforms: [
        .iOS(.v15),
        .watchOS(.v8),
        .tvOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "Casimir",
            targets: [
                "Casimir"
            ]
        ),
        .library(
            name: "Testimir",
            targets: [
                "Testimir"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/CombineCommunity/CombineExt", .exact("1.8.0")),
        .package(url: "https://github.com/tcldr/Entwine.git", .exact("0.9.1")),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .exact("1.9.6")),
        .package(url: "https://github.com/SwiftUIX/SwiftUIX.git", .exact("0.1.3"))
    ],
    targets: [
        .target(
            name: "Casimir",
            dependencies: [
                .product(name: "CombineExt", package: "CombineExt"),
                .product(name: "SwiftyBeaver", package: "SwiftyBeaver"),
                .product(name: "Entwine", package: "Entwine"),
                .product(name: "SwiftUIX", package: "SwiftUIX")
            ]
        ),
        .target(
            name: "Testimir",
            dependencies: [
                "Casimir",
                .product(name: "EntwineTest", package: "Entwine")
            ]
        ),
        .testTarget(
            name: "CasimirTests",
            dependencies: [
                "Casimir",
                "Testimir"
            ]
        )
    ]
)
