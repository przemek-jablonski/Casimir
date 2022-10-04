# Casimir
> "Met it wooden 🪵 and made it brickwalled 🧱" (Casimir the Great)
</br>
Complex extension suite targeted for rapid development using the multiplatform Apple Stack (SwiftUI, Combine)
</br>

## Installation

Available through Swift Package Manager.</br>
</br>
## Platform Availability

 iOS 15.0</br>
 iPadOS 15.0</br>
 macOS 12.0 Monterey</br>
 watchOS 8.0</br>
 tvOS 15.0</br>

also compliant with  Mac Catalyst
</br>

## Configure Casimir as a global import

1. Create new Objective-C header file (`.h`),
2. Add `#import <Casimir/Casimir.h>` at the very top,
3. Go to Project's `Build Settings`, set tab to `All | Combined`,
4. In section `Swift Compiler - General` find entry `Objective-C Bridging Header` and add your new Header file (if placed in main project folder, then `appname/AppName-BridgingHeader.h`),
5. Ensure that this entry is added for both `Debug` and `Release` and that `Precompile Bridging Header` is set to `YES`,
6. Done!
