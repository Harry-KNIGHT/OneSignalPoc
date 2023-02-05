//
//  NotificationRecapView.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import SwiftUI

struct NotificationRecapView: View {
	@EnvironmentObject private var notifVM: SendPushNotificationViewModel
	let notification: Notification
	@State private var showAlert: Bool = false
	var body: some View {
		VStack {
			Spacer()
			Text("Voulez-vous envoyer cette notification à vos abonnés ?")
				.font(.title)
			NotificationView(notification: Notification(
				includedSegments: ["Subscribed Users"],
				appID: oneSignalAppId,
				title: notification.title,
				text: notification.text,
				urlDeeplink: notification.urlDeeplink)
			)
			Spacer()

			SendNotificationButton(
				notification:
					Notification(
						includedSegments: [],
						appID: "", title:
							Contents(en: notification.title.en),
						text: Contents(en: notification.text.en),
						urlDeeplink: notification.urlDeeplink
					),
				showAlert: $showAlert
			)
		}
		.padding()
	}
}

struct NotificationRecapView_Previews: PreviewProvider {
	static var previews: some View {
		NotificationRecapView(notification: .notification)
			.environmentObject(SendPushNotificationViewModel())
	}
}
