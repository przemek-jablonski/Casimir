// swift-tools-version:5.5.0

import PackageDescription

let package = Package(
  name: "Casimir",
  platforms: [
    .iOS(.v14),
    .watchOS(.v7),
    .tvOS(.v14),
    .macOS(.v11)
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
    .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .exact("1.9.6"))
  ],
  targets: [
    .target(
      name: "Casimir",
      dependencies: [
        .product(name: "CombineExt", package: "CombineExt"),
        .product(name: "Entwine", package: "Entwine"),
        .product(name: "SwiftyBeaver", package: "SwiftyBeaver")
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
