//
//  Shop.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 09.05.2024.
//

import SwiftUI

class Furniture {
    let id: UUID = UUID()
    let name: String
    let image: String
    let newPrice: String
    let oldPrice: String
    var pieces: Int
    let imageB: String
    
    init(name: String, image: String, newPrice: String, oldPrice: String, pieces: Int, imageB: String) {
        self.name = name
        self.image = image
        self.newPrice = newPrice
        self.oldPrice = oldPrice
        self.pieces = pieces
        self.imageB = imageB
    }
}

class FurnitureModel: ObservableObject {
    @Published var furnitures: [Furniture] = [
        Furniture(name: "Sofa", image: "sofa", newPrice: "999", oldPrice: "2000$", pieces: 0, imageB: "sofaB"),
        Furniture(name: "Armchair", image: "armchair", newPrice: "99", oldPrice: "200$", pieces: 0, imageB: "bedB"),
        Furniture(name: "Bed", image: "bed", newPrice: "1000", oldPrice: "2000$", pieces: 0, imageB: "sofaB"),
        Furniture(name: "Table", image: "table", newPrice: "600", oldPrice: "1200$", pieces: 0, imageB: "chairB"),
        Furniture(name: "Chair", image: "chair", newPrice: "99", oldPrice: "200$", pieces: 0, imageB: "sofaB"),
        Furniture(name: "Wardrobe", image: "wardrobe", newPrice: "899", oldPrice: "1100$", pieces: 0, imageB: "chairB")
    ]
}

struct Shop: View {
    @ObservedObject var model = FurnitureModel()
    @State var totalPrice = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientHorizontal()
                
                Rectangle()
                    .fill(.white)
                    .padding(.top, 70)
                    .edgesIgnoringSafeArea(.bottom)
                VStack {
                    searchBarView()
                    
                    totalPriceView(totalPrice: $totalPrice)
                    
                    listFurnitureView(model: model, totalPrice: $totalPrice)
                    
                    Spacer()
                }
            }
        }
    }
}

struct searchBarView: View {
    @State var isMove = false
    
    var body: some View {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: 312, height: 48)
                        .cornerRadius(24)
                    HStack {
                        Image("search")
                        Text("Search...").foregroundColor(.gray)
                    }
                }
                Button(action: {
                    isMove = true
                }, label: {
                    Image("filter")
                })
                NavigationLink(destination: FilterView(), isActive: $isMove) {
                    EmptyView()
                }
            }
    }
}

struct totalPriceView: View {
    @Binding var totalPrice: Int
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Rectangle()
                    .fill(.green)
                    .frame(width: 300, height: 48)
                    .cornerRadius(12)
                HStack {
                    Text("Your total price")
                    Text("\(totalPrice) $")
                }
            }
        }.padding(.top, 30)
    }
}

struct listFurnitureView: View {
    @ObservedObject var model: FurnitureModel
    @Binding var totalPrice: Int
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(model.furnitures, id: \.id) { item in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("furnitureColor"))
                        .frame(width: 360, height: 120)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    HStack(spacing: 40) {
                        Image(item.image)
                            .resizable()
                            .frame(width: 140, height: 100)
                        VStack(spacing: 10) {
                            Text(item.name).font(.title2)
                            HStack(spacing: 20) {
                                Text(item.newPrice).font(.title2).foregroundColor(.green)
                                Text(item.oldPrice).font(.title2).strikethrough()
                            }
                            HStack(spacing: 20) {
                                Button(action: {
                                    item.pieces -= 1
                                    let price = totalPrice - (Int(item.newPrice) ?? 0)
                                    if price >= 0 {
                                        totalPrice = totalPrice - (Int(item.newPrice) ?? 0)
                                    }
                                    print(item.pieces)
                                }, label: {
                                    Text("-")
                                })
                                Text("\(item.pieces)")
                                Button(action: {
                                    item.pieces += 1
                                    totalPrice = totalPrice + (Int(item.newPrice) ?? 0)
                                    print(item.pieces)
                                }, label: {
                                    Text("+")
                                })
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Shop()
}
