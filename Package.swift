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
            targets: ["KahfAdSDK"]
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
            url: "https://github.com/rickclephas/KMP-NativeCoroutines.git",
            .exact("1.0.0-ALPHA-44")
        )
    ],
    targets: [
        .binaryTarget(
            name: "KahfAdSDK",
            path: "Binaries/KahfAdSDK.xcframework",
        ),

    ]
)
