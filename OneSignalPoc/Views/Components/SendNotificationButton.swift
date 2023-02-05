//
//  SendNotificationButton.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import SwiftUI

struct SendNotificationButton: View {
	@EnvironmentObject var notifVM: SendPushNotificationViewModel
	
	let notification: Notification
	@Binding var showAlert: Bool
    var body: some View {
		Button(action: {
			showAlert = true
		}, label: {
			Text("Envoyer la notification")
				.font(.title3.bold())
				.padding(10)
				.frame(maxWidth: .infinity)
		})
		.buttonStyle(.borderedProminent)
		.alert("Envoyer la notification ?", isPresented: $showAlert) {
			Button(action: {
				self.notifVM.sendNotification(
					notification.title.en,
					notification.text.en,
					notification.urlDeeplink)
			}, label: {
				Text("Envoyer")
			})
			Button(role: .cancel, action: {
				showAlert = false
			}, label: {
				Text("Annuler")
			})
		}

    }
}

struct SendNotificationButton_Previews: PreviewProvider {
    static var previews: some View {
		SendNotificationButton(notification: .notification, showAlert: .constant(false))
			.environmentObject(SendPushNotificationViewModel())
    }
}
