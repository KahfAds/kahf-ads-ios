//
//  AppDelegate.swift
//  Example-SwiftUI
//
//  Created by MD RUBEL on 5/20/25.
//

import UIKit
import KahfAdsIosSdk

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        KahfAdsSdk.shared.initialize(config: KahfAdsSdkConfig(fallbackPublisherId: "muslims-day"))
        
        
        return true
    }
}
