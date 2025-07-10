//
//  ContentView.swift
//  Example-SwiftUI
//
//  Created by MD RUBEL on 5/20/25.
//

import SwiftUI
import KahfAdsIosSdk

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("--- Ad Space ---")
                .font(.caption)
                .foregroundColor(.secondary)
            
            LargeBannerAdView(
                viewConfig: KahfAdsViewConfig(
                    screenName: "HomeScreen",
                    placementId: .Epom("ea0443cc23fd2fcb99187057f3fa85dc"),
                    refreshIntervalInMillis: 10000
                ),
                adImpressionListener: AdImpressionListenerImpl(),
                fallbackAdImpressionListener: FallbackAdImpressionListenerImpl()
            )
            .background(Color.gray.opacity(0.1))
        }
        .padding()
    }
}

class AdImpressionListenerImpl: AdImpressionListener {
    func onAdClicked(urlToLoad: String) -> Bool {
        print("Ad clicked with URL: \(urlToLoad)")
        // Return false to let SDK handle the URL, or true to handle it yourself
        return false
    }

    func onAdFailedToLoad(message: String, cause: KahfAdsError?) {
        print("Ad failed to load: \(message)")
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
        // Return false to let SDK handle the URL, or true to handle it yourself
        return false
    }

    func onFallbackAdFailedToLoad(message: String, cause: KahfAdsError?) {
        print("Fallback Ad failed to load: \(message)")
        if let cause = cause {
            print("Error details: \(cause)")
        }
    }

    func onFallbackAdLoaded(primaryAdError: KahfAdsError?, headline: String) {
        print("Fallback Ad loaded with headline: \(headline)")
        if let primaryError = primaryAdError {
            print("Primary ad error: \(primaryError)")
        }
    }
}

#Preview {
    ContentView()
}
