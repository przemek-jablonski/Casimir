// swift-tools-version:5.5.0

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
    .package(url: "https://github.com/tcldr/Entwine.git", .exact("0.9.1")),
  ],
  targets: [
    .target(
      name: "Casimir",
      dependencies: []
    ),
    .target(
      name: "Testimir",
      dependencies: [
        "Casimir",
        .product(name: "Entwine", package: "Entwine"),
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
