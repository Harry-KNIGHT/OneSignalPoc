//
//  OneSignalPocApp.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 03/02/2023.
//

import SwiftUI
import OneSignal

@main
struct OneSignalPocApp: App {
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(SendPushNotificationViewModel())
		}
	}
}

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
	   // Remove this method to stop OneSignal Debugging
	   OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)

	   OneSignal.initWithLaunchOptions(launchOptions)
	   OneSignal.setAppId("86b10622-4102-42b2-ab95-a0f82167cf3b")

	   OneSignal.promptForPushNotifications(userResponse: { accepted in
		 print("User accepted notification: \(accepted)")
	   })
		
	   return true
	}
}
