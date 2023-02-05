//
//  SendPushNotificationViewModel.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 04/02/2023.
//

import Foundation
import UIKit

class SendPushNotificationViewModel: ObservableObject {

	private let oneSignalUrl = URL(string: "https://onesignal.com/api/v1/notifications")

	func sendNotification() {
		guard let url = oneSignalUrl else { return }

		var request = URLRequest(url: url)
		request.httpMethod = "POST"

		request.setValue("Basic \(oneSignalApiKey)", forHTTPHeaderField: "Authorization")
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		let notification = Notification(
			includedSegments: ["Subscribed Users"],
			appID: oneSignalAppId,
			title: Contents(en: "First post done"),
			text: Contents(en:"Notification send from my app"),
			urlDeeplink: "https://bokitfinder.fr"
		)

		let jsonEncoder = JSONEncoder()
		let jsonData = try? jsonEncoder.encode(notification)
		request.httpBody = jsonData

		URLSession.shared.dataTask(with: request) { data, response, error in
			guard let response = response as? HTTPURLResponse, response.statusCode == 200,
				error == nil else { return  }

			if let data {
				_ = try? JSONSerialization.jsonObject(with: data)
			}
		}.resume()

	}
}
