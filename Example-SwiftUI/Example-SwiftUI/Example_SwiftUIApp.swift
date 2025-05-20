//
//  Example_SwiftUIApp.swift
//  Example-SwiftUI
//
//  Created by MD RUBEL on 5/20/25.
//

import SwiftUI

@main
struct Example_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
