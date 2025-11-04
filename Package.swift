// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "KahfAdsSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // The only product your customers select
        .library(
            name: "KahfAdsSDK",
            targets: ["KahfAdsSDK"]
        ),
    ],
    dependencies: [
        // ─────────────── Third-party packages ───────────────
        .package(
            url: "https://github.com/kaishin/Gifu.git",
            .exact("3.2.2")
        ),
        .package(
            url: "https://github.com/kean/Nuke.git",
            .exact("12.8.0")
        ),
        .package(
            url: "https://github.com/bugsnag/bugsnag-cocoa",
            .exact("6.34.1")
        ),
        .package(url: "https://github.com/rickclephas/KMP-NativeCoroutines.git", exact: "1.0.0-ALPHA-46"),
        .package(
            url: "https://github.com/facebook/facebook-ios-sdk",
            .exact("18.0.1")
        )
    ],
    targets: [
        .binaryTarget(
            name: "KahfAdsIosSdk",
            path: "Binaries/KahfAdsIosSdk.xcframework"
        ),
        .target(
            name: "KahfAdsSDK",
            dependencies: [
                "KahfAdsIosSdk",
                "Gifu",
                "Nuke", 
                .product(name: "KMPNativeCoroutinesCore", package: "KMP-NativeCoroutines"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                .product(name: "FacebookLogin", package: "facebook-ios-sdk"),
                .product(name: "FacebookShare", package: "facebook-ios-sdk")
            ]
        )
    ]
)
