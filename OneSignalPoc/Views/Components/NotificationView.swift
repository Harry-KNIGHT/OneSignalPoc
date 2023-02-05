//
//  NotificationView.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import SwiftUI

struct NotificationView: View {
	let notification: Notification

    var body: some View {
		HStack {
			Rectangle()
				.frame(width: 50, height: 50)
				.cornerRadius(10)
				.foregroundColor(.orange)

			VStack(alignment: .leading, spacing: 10) {
				Text(notification.title.en)
					.font(.title3)
					.fontWeight(.medium)

				Text(notification.text.en)
					.multilineTextAlignment(.leading)
			}
			Spacer()
		}
		.padding(5)
		.background(.thinMaterial)
		.cornerRadius(20)
		.padding(.horizontal)
		.shadow(radius: 2)

    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
		NotificationView(notification: .notification)
    }
}
