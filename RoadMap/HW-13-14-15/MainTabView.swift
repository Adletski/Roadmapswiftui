//
//  MainTabView.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 09.05.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            Shop().tabItem {
                selectedTab == 0 ? Image("shopSelected") : Image("shop")
            }.tag(0)
            
            Text("Basket tab 2").tabItem {
                Image("basket").foregroundColor(selectedTab == 1 ? .green : .gray)
            }.tag(1)
            
            Profile().tabItem {
                selectedTab == 2 ? Image("profileSelected") : Image("profile")
            }.tag(2)
            
        }
    }
}

#Preview {
    MainTabView()
}
