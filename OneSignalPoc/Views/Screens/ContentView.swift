//
//  ContentView.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var notifVM: SendPushNotificationViewModel
	@State private var title: String = ""
	@State private var subTitle: String = ""
	@State private var message: String = ""
	@State private var url: String = ""
	@State private var hasURL: Bool = false
	@State private var hasSubTitle = false
	@State private var showSendNotificationSheetView: Bool = false
	var body: some View {
		NavigationStack {
			List {
				Section {
					TextField("Titre", text: $title)
					Toggle("Sous titre", isOn: $hasSubTitle.animation())
					if hasSubTitle {
						TextField("Sous titre", text: $subTitle)
					}
				}

				Section {
					TextField("Message", text: $message)
				}

				Toggle("Ajout url", isOn: $hasURL.animation())

				if hasURL {
					TextField("Https://bokitfinder.fr", text: $url)
				}
				Section {
					Button("Voir la notification") {
						self.showSendNotificationSheetView = true
					}
				}
			}
			.sheet(isPresented: $showSendNotificationSheetView) {
				NotificationRecapView(
					notification: Notification(
						includedSegments: [],
						appID: "",
						title: Contents(en: title),
						text: Contents(en: message),
						urlDeeplink: url
					)
				)
			}
			.navigationTitle("Envoi notification")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.environmentObject(SendPushNotificationViewModel())
	}
}
