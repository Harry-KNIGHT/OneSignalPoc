//
//  NotificationRecapView.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import SwiftUI

struct NotificationRecapView: View {
	let notification: Notification
	var body: some View {
		VStack {
			Text("Voulez-vous envoyer cette notification à vos abonnés ?")
				.font(.title)
			NotificationView(notification: Notification(
				includedSegments: ["Subscribed Users"],
				appID: oneSignalAppId,
				title: notification.title,
				text: notification.text,
				urlDeeplink: notification.urlDeeplink)
			)
		}
	}
}

struct NotificationRecapView_Previews: PreviewProvider {
	static var previews: some View {
		NotificationRecapView(notification: .notification)
	}
}
