# Casimir
###### The best Swift extension package in the business. From me, for me 🤷‍♀️
</br>

## Installation

Available for Carthage only. I think.

Add to the `Cartfile`:

`github "sharaquss/Casimir"`

</br>

## Configure Casimir as a global import
###### _"Even single file without Casimir is not worth looking at"_

1. Create new Objective-C header file (`.h`),
2. Add `#import <Casimir/Casimir.h>` at the very top,
3. Go to Project's `Build Settings`, set tab to `All | Combined`,
4. In section `Swift Compiler - General` find entry `Objective-C Bridging Header` and add your new Header file (if placed in main project folder, then `appname/AppName-BridgingHeader.h`),
5. Ensure that this entry is added for both `Debug` and `Release` and that `Precompile Bridging Header` is set to `YES`,
6. Done!
