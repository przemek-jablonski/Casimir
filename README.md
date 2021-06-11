# Casimir
> "Met it wooden 🪵 and made it brickwalled 🧱" (Casimir the Great)
</br>
Complex extension suite targeted for rapid development using the multiplatform Apple Stack (SwiftUI, Combine)
</br>

## Installation

Available through Swift Package Manager.</br>
</br>
## Platform Availability

 iOS 14.0</br>
 iPadOS 14.0</br>
 macOS 11.0 Big Sur</br>
 watchOS 7.0</br>
 tvOS 14.0</br>

also compliant with  Mac Catalyst
</br>

## Configure Casimir as a global import

1. Create new Objective-C header file (`.h`),
2. Add `#import <Casimir/Casimir.h>` at the very top,
3. Go to Project's `Build Settings`, set tab to `All | Combined`,
4. In section `Swift Compiler - General` find entry `Objective-C Bridging Header` and add your new Header file (if placed in main project folder, then `appname/AppName-BridgingHeader.h`),
5. Ensure that this entry is added for both `Debug` and `Release` and that `Precompile Bridging Header` is set to `YES`,
6. Done!
