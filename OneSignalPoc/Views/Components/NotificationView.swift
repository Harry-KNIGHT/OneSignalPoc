//
//  NotificationView.swift
//  OneSignalPoc
//
//  Created by Elliot Knight on 05/02/2023.
//

import SwiftUI

struct NotificationView: View {
	@Binding var title: String
	@Binding var subTitle: String
	@Binding var message: String

    var body: some View {
		HStack {
			Rectangle()
				.frame(width: 50, height: 50)
				.cornerRadius(10)
				.foregroundColor(.orange)

			VStack(alignment: .leading, spacing: 10) {
				Text(title.isEmpty ? "Titre de notification" : title)
					.font(.title3)
					.fontWeight(.medium)

				if !subTitle.isEmpty {
					Text(subTitle)
				}

				Text(message.isEmpty ? "Nous avons concocté une soirée spéciale avec des guests, Axel Tony et un danseur reconnu mondialement de Kizomba !" : message)
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
		NotificationView(title: .constant("Soirée Kizomba"), subTitle: .constant(""), message: .constant(""))
    }
}
