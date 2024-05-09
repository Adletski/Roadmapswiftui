//
//  ContentView.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 08.05.2024.
//

import SwiftUI

struct Lesson14: View {
    let columns: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: nil, pinnedViews: []) {
                profileSection
                photoSection
            }
        }
    }
    
    var photoSection: some View {
        Section {
            ForEach(0..<50) { index in
                Image("1")
                    .resizable()
                    .frame(height: 150)
            }
        } header: {
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "house")
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "person")
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "mail")
                })
            }.padding()
        }
    }
    
    var profileSection: some View {
        Section {
            VStack {
                Image("1")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                Text("Dog")
                    .fontWeight(.bold)
            }
            VStack {
                Text("150")
                    .fontWeight(.bold)
                Text("Followers")
                    .fontWeight(.bold)
            }
            VStack {
                Text("120")
                    .fontWeight(.bold)
                Text("Following")
                    .fontWeight(.bold)
            }
        } header: {
            HStack {
                Spacer()
                Text("Instadog")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            .background(.white)
        }
    }
}

#Preview {
    Lesson14()
}
