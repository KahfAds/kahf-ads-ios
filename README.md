# KahfAdsProvider SDK

The `KahfAdsProvider` SDK is a lightweight ad management utility designed to integrate banner and video ads into your SwiftUI applications.

---

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Public API](#public-api)
  - [KahfAdsProvider](#kahfadsprovider)
  - [KahfAdsConfig](#kahfadsconfig)
  - [KahfAdsType](#kahfadstype)
  - [KahfAdsListener](#kahfadslistener)
  - [KahfAdsDelegate](#kahfadsdelegate)

---

## Installation

Add the SDK to your project using Swift Package Manager or manually integrate the source files into your project.

---

## Usage

Initialize the SDK in `AppDelegate`:

```swift
KahfAdsProvider.shared.initialize(withToken: "YOUR_PUBLISHER_ID")
```

Render an ad view in SwiftUI:

```swift
let config = KahfAdsConfig(adType: .BANNER_AD, divId: "home_banner", screenName: "HomeView")
KahfAdsProvider.shared.getView(for: config)
```

---

## Public API

### KahfAdsProvider

```swift
final public class KahfAdsProvider: ObservableObject
```

Singleton class that manages ad lifecycle and rendering.

#### Properties

- `static let shared`: Singleton instance.
- `delegate: KahfAdsDelegate?`: Optional delegate for ad events. **Do not use with `listener`.**
- `listener: CurrentValueSubject<KahfAdsListener?, Never>`: Reactive listener for ad events. **Do not use with `delegate`.**
- `setAdClickListener: ((_ url: String?) -> Void)?`: Closure invoked when an ad is clicked.

#### Methods

- `func initialize(withToken: String, campaignTypes: String = "paid|publisher-house|community|house")`: Initializes the SDK with the provided token and optional campaign types.

- `@ViewBuilder func getView(for config: KahfAdsConfig) -> some View`: Returns a SwiftUI view representing the ad.

- `func refreshAd(for config: KahfAdsConfig, startAutoRefresh: Bool = true)`: Manually refreshes an ad and optionally restarts auto-refresh.

- `func stopAutoRefresh(for config: KahfAdsConfig)`: Stops auto-refresh for a given ad configuration.

---

### KahfAdsConfig

```swift
public struct KahfAdsConfig
```

Configuration object used to request and render ads.

#### Initializer

```swift
init(adType: KahfAdsType, divId: String, screenName: String, autoHide: Bool = true)
```

- `adType`: The type of ad to be displayed.
- `divId`: Unique identifier for the ad slot.
- `screenName`: Identifier for the screen where the ad appears.
- `autoHide`: If `true`, hides the ad when it's not available (default is `true`).

---

### KahfAdsType

```swift
public enum KahfAdsType: String
```

Represents types of ads supported by the SDK.

- `.BANNER_AD`
- `.VIDEO_FEED_AD`
- `.VIDEO_SHORTS_AD`

---

### KahfAdsListener

```swift
public enum KahfAdsListener
```

Represents ad events when using `listener`.

- `.onAdLoaded`
- `.onAdFailedToLoad(message: String?)`
- `.onAdClicked`

---

### KahfAdsDelegate

```swift
public protocol KahfAdsDelegate: AnyObject
```

Delegate interface for receiving ad events.

```swift
func onAdLoaded()
func onAdFailedToLoad(message: String?)
func onAdClicked()
```

---

## Best Practices

- Use **either** `delegate` or `listener`, **not both**.
- Always call `stopAutoRefresh(for:)` when your ad view disappears to avoid memory leaks or unintended refreshes.
- Provide a valid `setAdClickListener` implementation if you want to handle ad click URLs inside your app.

---

## License

MIT or other license terms here.

---