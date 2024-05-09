//
//  Profile.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 09.05.2024.
//

import SwiftUI

struct SettingsModel {
    let id: UUID = UUID()
    let image: String
    let name: String
    let badge: String?
}

struct Profile: View {
    
    let settings: [SettingsModel] = [
        SettingsModel(image: "message", name: "City", badge: "3"),
        SettingsModel(image: "bell", name: "Notification", badge: "4"),
        SettingsModel(image: "account", name: "Account details", badge: nil),
        SettingsModel(image: "basket", name: "My purchases", badge: nil),
        SettingsModel(image: "settings", name: "Settings", badge: nil)
    ]
    
    var body: some View {
        ZStack {
            BackgroundGradientHorizontal()
            
            Rectangle().fill(.white).edgesIgnoringSafeArea(.bottom).padding(.top, 30)
            
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("photoColor"))
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    Image("photo")
                }
                Text("Your Name").font(.title2).fontWeight(.bold)
                HStack {
                    Image("geo")
                    Text("City")
                }
                
                List(settings, id: \.id) { item in
                    HStack {
                        Image(item.image)
                        Text(item.name)
                        Spacer()
                        ZStack {
                            Rectangle()
                                .fill(.green)
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            Text(item.badge ?? "")
                        }
                    }
                }
                
                Spacer()
            }.padding(.top, 70)
        }
    }
}

#Preview {
    Profile()
}
