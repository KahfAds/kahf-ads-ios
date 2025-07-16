# KahfAdDK

The `KahfAdProvider` is a lightweight ad management utility designed to integrate banner and video ads into your SwiftUI applications.

---

## Table of Contents

- [Installation](#installation)
 - [Usage](#usage)
   - [Step 1: Initialize SDK in AppDelegate](#step-1-initialize-sdk-in-appdelegate)
   - [Step 2: Use Banner Ad Views in SwiftUI](#step-2-use-banner-ad-views-in-swiftui)
   - [Step 3: Implement Ad Impression Listeners](#step-3-implement-ad-impression-listeners)

---

## Installation

You can add the SDK via **Swift Package Manager** or manually:

### Swift Package Manager (Recommended)

1. In Xcode, go to `File > Add Packages`.
2. Enter the package URL: `https://github.com/KahfAds/kahf-ads-ios.git`
3. Choose the latest version (1.0.4-beta04) and finish the setup.

---

## Usage

### Step 1: Initialize SDK in AppDelegate

```swift
import UIKit
import KahfAdsIosSdk

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // ... other code...
        
        KahfAdsSdk.shared.initialize(config: KahfAdsSdkConfig(fallbackPublisherId: "muslims-day"))
        return true
    }
}
```

### Step 2: Use Banner Ad Views in SwiftUI

```swift
import KahfAdsIosSdk

LargeBannerAdView(
    viewConfig: KahfAdsViewConfig(
        screenName: "<SCREEN_OR_ELEMENT_NAME>",
        placementId: .Epom("<YOUR_PLACEMENT_ID>"),
        refreshIntervalInMillis: 30000  // Minimum can be 10 seconds
    ),
    adImpressionListener: AdImpressionListenerImpl(),
    fallbackAdImpressionListener: FallbackAdImpressionListenerImpl()
)
```

Supported views:
- `LargeBannerAdView`
- `MediumBannerAdView`
- `SmallBannerAdView`

### Step 3: Implement Ad Impression Listeners

```swift
class AdImpressionListenerImpl: AdImpressionListener {
    func onAdClicked(urlToLoad: String) -> Bool {
        print("Ad clicked with URL: \(urlToLoad)")
        return false  // Return false if you want the click to be handled by the SDK
    }

    func onAdFailedToLoad(message: String, cause: KahfAdsError?) {
        if let cause = cause {
            print("Error details: \(cause)")
        }
    }

    func onAdLoaded() {
        print("Ad loaded successfully.")
    }
}

class FallbackAdImpressionListenerImpl: FallbackAdImpressionListener {
    func onFallbackAdClicked(urlToLoad: String) -> Bool {
        print("Fallback Ad clicked with URL: \(urlToLoad)")
        return false  // Return false if you want the click to be handled by the SDK
    }

    func onFallbackAdFailedToLoad(message: String, cause: KahfAdsError?) {
        if let cause = cause {
            print("Error details: \(cause)")
        }
    }

    func onFallbackAdLoaded(primaryAdError: KahfAdsError?, headline: String) {
        if let primaryError = primaryAdError {
            print("Primary ad error: \(primaryError)")
        }
    }
}
```
