//
//  ContentView.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var notifVM: SendPushNotificationViewModel
	var body: some View {
		VStack {
			Text("Test d'envoi de notification")
			Button(
				action: {
					notifVM.sendNotification()
				},
				label: {
					Label("Send Notification", systemImage: "paperplane")
				}
			).buttonStyle(.borderedProminent)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(SendPushNotificationViewModel())
	}
}
