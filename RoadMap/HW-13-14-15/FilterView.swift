//
//  FilterView.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 09.05.2024.
//

import SwiftUI

struct FilterView: View {
    
    var furnitures: [Furniture] = [
        Furniture(name: "Sofa", image: "sofa", newPrice: "999", oldPrice: "2000$", pieces: 0, imageB: "sofaB"),
        Furniture(name: "Armchair", image: "armchair", newPrice: "99", oldPrice: "200$", pieces: 0, imageB: "bedB"),
        Furniture(name: "Bed", image: "bed", newPrice: "1000", oldPrice: "2000$", pieces: 0, imageB: "sofaB"),
        Furniture(name: "Table", image: "table", newPrice: "600", oldPrice: "1200$", pieces: 0, imageB: "chairB"),
        Furniture(name: "Chair", image: "chair", newPrice: "99", oldPrice: "200$", pieces: 0, imageB: "sofaB"),
        Furniture(name: "Wardrobe", image: "wardrobe", newPrice: "899", oldPrice: "1100$", pieces: 0, imageB: "chairB")
    ]
    let colors = ["blue","brown","cyan","green","orange","pink","purple","red","white","yellow"]
    @State var sliderValue = 0.0
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20),
    ]
    
    var body: some View {
        ZStack {
            BackgroundGradientHorizontal()
            Rectangle()
                .fill(.white)
                .edgesIgnoringSafeArea(.bottom)
            VStack(spacing: 20) {
                
                CategoryView()
                
                ScrollFurnitureView(furnitures: furnitures)
                
                HStack {
                    Text("Prices")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                }
                
                Slider(value: $sliderValue, in: 0...10000, step: 500) { editing in
                    print(editing)
                }
                HStack {
                    Text(String(format: "$%.f", sliderValue))
                    Spacer()
                }
                HStack {
                    Text("Color")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<colors.count) { index in
                            Circle()
                                .fill(Color(colors[index]))
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Circle().stroke(Color.gray, lineWidth: 1)
                                )
                            
                        }
                    }
                }
                
                Spacer()
            }.padding()
            .navigationTitle("Filters")
        }
        .navigationTitle("Filters")
    }
}

struct CategoryView: View {
    var body: some View {
        HStack {
            Text("Category")
                .font(.system(size: 24))
                .fontWeight(.bold)
            Spacer()
            Text("More")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct ScrollFurnitureView: View {
    var furnitures: [Furniture]
    let columns: [GridItem] = [.init(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns) {
                ForEach(furnitures, id: \.id) { item in
                    ZStack {
                        Rectangle()
                            .fill(.gray)
                            .frame(width: 120, height: 80)
                            .cornerRadius(12)
                        Image(item.imageB)
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
            }
        }.frame(width: .infinity, height: 89)
    }
}

#Preview {
    FilterView()
}
