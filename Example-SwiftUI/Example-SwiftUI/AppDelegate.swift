//
//  AppDelegate.swift
//  Example-SwiftUI
//
//  Created by MD RUBEL on 5/20/25.
//

import UIKit
import KahfAdSDK

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        // TODO: Replace with your actual token
        let token: String = <#Token#>
        KahfAdProvider.shared.initialize(withToken: token)
        
        // Change auto refresh time interval if needed (in seconds). Default is 10 seconds.
        KahfAdProvider.shared.setAutoRefreshTime(15)
        
        return true
    }
}
