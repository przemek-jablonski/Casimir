# Casimir
> "Met it wooden 🪵 and made it brickwalled 🧱" (Casimir the Great)

Complex extension suite for rapid development using the multiplatform Apple Stack (SwiftUI, Combine)

</br>

## Usage

Some of the features:
- Easy architectural elements, like `ModelProtocol`, `Randomable`, `Selectable` and `LocalizedString`.
- Out-of-the-box custom loggers, such as logger for sending diagnostic data to Firebase as non-fatals.
- Custom Combine operators closing the gap with `Rx*`, such as `WithPrevious`, `PreventCompletion`, `Single`, `On` or `Retry`.
- Streamlining API for testing `Publisher` streams using `TestScheduler` and `TestSequence`.
- Hundreds of extensions to Apple's `Foundation`, including custom `Math` operations like `lerp` and also `LoremIpsum`s, `CURL` or `Errors`.
- Expanding core Apple APIs with reactive Combine support
- and more...

</br>

## Installation

Add dependency to the project:
```swift
dependencies: [
    ...
    .package(url: "https://github.com/przemek-jablonski/Casimir.git", exact: "latest-tag-here")
]
```


Enable core library (`Casimir`):
```swift
.target(
    name: "YourLibrary",
    dependencies: [
        .product(name: "Casimir", package: "Casimir"),
    ]
),
```

Enable testing library (`Testimir`):
```swift
.testTarget(
    name: "YourLibraryTests",
    dependencies: [
        .product(name: "Testimir", package: "Casimir"),
    ]
),
```

</br>

## Platform Availability

 iOS 15.0</br>
 iPadOS 15.0</br>
 tvOS 15.0</br>
 macOS 12.0</br>
 watchOS 8.0</br>

also compliant with  Mac Catalyst

</br>

## Configure Casimir as a global import

1. Create new Objective-C header file (`.h`),
2. Add `#import <Casimir/Casimir.h>` at the very top,
3. Go to Project's `Build Settings`, set tab to `All | Combined`,
4. In section `Swift Compiler - General` find entry `Objective-C Bridging Header` and add your new Header file (if placed in main project folder, then `appname/AppName-BridgingHeader.h`),
5. Ensure that this entry is added for both `Debug` and `Release` and that `Precompile Bridging Header` is set to `YES`,
6. Done!
