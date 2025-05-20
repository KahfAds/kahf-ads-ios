//
//  AppDelegate.swift
//  Example-UIKit
//
//  Created by MD RUBEL on 5/16/25.
//

import UIKit
import KahfAdSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // TODO: Replace with your actual token
        let token: String = <#Token#>
        KahfAdProvider.shared.initialize(withToken: token)
        
        return true
    }
}
