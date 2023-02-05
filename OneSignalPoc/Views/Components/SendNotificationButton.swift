//
//  SendNotificationButton.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import SwiftUI

struct SendNotificationButton: View {
	@EnvironmentObject var notifVM: SendPushNotificationViewModel
	@EnvironmentObject var rulesVM: NotificationRulesViewModel

	@Binding var title: String
	@Binding var message: String
	@Binding var url: String
	@Binding var showAlert: Bool
	var body: some View {

		Button("Voir la notification") {
			self.showAlert = true
		}
		.alert("Envoyer la notification ?", isPresented: $showAlert) {
			Button("Envoyer") {
				notifVM.sendNotification(title, message, url)
				rulesVM.resetStates(&title, &message, &url)
			}
			Button("Annuler", role: .cancel) { showAlert = false }

		} message: {
			AlertMessageView(title: $title, message: $message, url: $url)
		}
	}
}

struct SendNotificationButton_Previews: PreviewProvider {
	static var previews: some View {
		SendNotificationButton(title: .constant("Titre de la notification"), message: .constant("Message long et précis sur ce que nous allons vous proposer"), url: .constant("https://bokitfinder.fr"), showAlert: .constant(false))
			.environmentObject(SendPushNotificationViewModel())
			.environmentObject(NotificationRulesViewModel())
	}
}

struct AlertMessageView: View {
	@Binding var title: String
	@Binding var message: String
	@Binding var url: String
	var body: some View {
		Text(
"""
Titre: \(title)
Message: \(message)
Url: \(url)
"""
		)
	}
}
