//
//  BackgroundGradient.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 09.05.2024.
//

import SwiftUI

struct BackgroundGradientHorizontal: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(red: 175/255, green: 224/255, blue: 197/255),
            Color(red: 50/255, green: 75/255, blue: 53/255)
        ]), startPoint: .leading, endPoint: .trailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundGradientVertical: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            Color(red: 175/255, green: 224/255, blue: 197/255),
            Color(red: 50/255, green: 75/255, blue: 53/255)
        ]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
}
