//
//  NotificationModel.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 04/02/2023.
//

import Foundation

import Foundation

struct Notification: Codable {
	let includedSegments: [String]
	let appID: String
	let title, message: Contents
	let urlDeeplink: String

	enum CodingKeys: String, CodingKey {
		case includedSegments = "included_segments"
		case appID = "app_id"
		case title = "headings"
		case message = "contents"
		case urlDeeplink = "url"
	}
}


struct Contents: Codable {
	let en: String
}


extension Notification {
	public static let notification = Notification(
		includedSegments: ["Subscribed Users"],
		appID: oneSignalAppId,
		title: Contents(en: "Notification Title"),
		message: Contents(en: "This is a message about our super app feature"),
		urlDeeplink: "http://bokitfinder.fr"
	)
}
