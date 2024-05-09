//
//  Lesson15.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 08.05.2024.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    let price: String
}

struct Lesson15: View {
    
    var products: [Product] = [
        Product(image: "1", title: "Adlet", description: "Hello world", price: "15110 tg"),
        Product(image: "1", title: "Dauka", description: "Hello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello world", price: "15110 tg"),
        Product(image: "1", title: "Beka", description: "Hello world", price: "151230 tg"),
        Product(image: "1", title: "Masha", description: "Hello world", price: "151230 tg"),
        Product(image: "1", title: "Daria", description: "Hello world", price: "11230 tg"),
        Product(image: "1", title: "Elena", description: "Hello world", price: "1500 tg")
    ]
    
    var body: some View {
        NavigationView {
            List(products, id: \.id) { product in
                NavigationLink {
                    ProductItemView(product: product)
                } label: {
                    makeProduct(product: product)
                }
            }
            .navigationTitle("Dogs shop")
        }
    }
    
    func makeProduct(product: Product) -> some View {
        HStack {
            Image(product.image)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(product.title)
                Text(product.description)
                    .foregroundColor(.gray)
                    .font(.caption2)
                    .fontWeight(.light)
                    .padding(.bottom)
                    .lineLimit(2)
                Text(product.price)
                    .font(.caption)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text("Название - " + product.title)
                        .font(.title)
                        .fontWeight(.medium)
                    Text("Цена - " + product.price)
                    Text("Описание - " + product.description)
                } header: {
                    Image(product.image)
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(10)
                }
            }
            
            Button(action: {
                print("add to basket")
            }, label: {
                Text("Добавить в корзину")
                    .foregroundColor(.white)
                    .padding(.all, 6)
                    .background(.red)
                    .cornerRadius(10)
            }).padding(.bottom)
        }
    }
}

#Preview {
    Lesson15()
}
