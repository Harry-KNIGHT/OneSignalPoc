//
//  NotificationRulesViewModel.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import Foundation

class NotificationRulesViewModel: ObservableObject {
	func isNotificationCanBeSend(_ title: String,_ message: String) -> Bool {
		title.count < 5  && message.count < 5
	}

	func resetStates(_ title: inout String,_ message: inout String,_ url: inout String) {
		title = ""
		message = ""
		url = ""
	}
}
