//
//  SendNotificationButton.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import SwiftUI

struct SendNotificationButton: View {
	@EnvironmentObject var notifVM: SendPushNotificationViewModel
	
	@Binding var title: String
	@Binding var message: String
	@Binding var url: String
    var body: some View {
		Button(
			action: {
				notifVM.sendNotification(title, message, url)
			},
			label: {
				Label("Send Notification", systemImage: "paperplane")
					.font(.title)
					.frame(maxWidth: .infinity)
			}
		)
		.buttonStyle(.borderedProminent)
		.padding(.horizontal)
    }
}

struct SendNotificationButton_Previews: PreviewProvider {
    static var previews: some View {
		SendNotificationButton(title: .constant("title"), message: .constant("message"), url: .constant("url"))
			.environmentObject(SendPushNotificationViewModel())
    }
}
