//
//  hw161718.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 10.05.2024.
//

import SwiftUI

struct TapView: View {
    
    @State var cardholderName: String = ""
    @State var cardNumber: String = ""
    @State var cvv: String = ""
    
    var body: some View {
        ZStack {
            BackgroundGradientHorizontal()
            
            Rectangle()
                .fill(.white)
                .edgesIgnoringSafeArea(.bottom)
                .padding(.top, 50)
            VStack {
                
                CardView()
            
                InfoView(cardholderName: $cardholderName, cardNumber: $cardNumber, cvv: $cvv)
                
                Spacer()
            }.padding(.top, 80)
        }
    }
}

struct InfoView: View {
    
    @Binding var cardholderName: String
    @Binding var cardNumber: String
    @State var selectedDate = Date()
    @Binding var cvv: String
    @State var isEyeOpen = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Add new card")
            TextField("Cardholder name", text: $cardholderName)
            Text("Card number")
            TextField("0000 0000 0000 0000", text: $cardNumber)
            
            HStack {
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.automatic)
                DatePicker("Year", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.automatic)
            }
            Text("CVV")
            HStack {
                
                if isEyeOpen {
                    TextField("000", text: $cvv)
                } else {
                    SecureField("000", text: $cvv)
                }
                
                Button(action: {
                    isEyeOpen.toggle()
                }, label: {
                    if isEyeOpen {
                        Image("eyeOpen")
                    } else {
                        Image("eyeClosed")
                    }
                })
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Add now")
            })
            .foregroundColor(.white)
            .frame(width: 300, height: 55)
            .background(BackgroundGradientHorizontal())
            .cornerRadius(27)
            .padding(.leading, 30)
        }.padding([.top, .leading, .trailing], 20)
    }
}

struct CardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Spacer()
                Image("logoMir").padding([.top, .trailing], 20)
            }
            
            VStack(alignment: .leading) {
                Text("**** **** **** 0000").font(.system(size: 20, weight: .bold))
                Text("Card number").font(.system(size: 16, weight: .light)).foregroundColor(Color(red: 227, green: 226, blue: 226))
                Text("Your name").padding(.top, 10).font(.system(size: 20, weight: .bold))
                Text("Cardholder").font(.system(size: 16, weight: .light)).foregroundColor(Color(red: 227, green: 226, blue: 226))
            }.padding(.leading, 30)
            Spacer()
        }
        .foregroundColor(.white)
        .frame(width: 310, height: 180)
        .background(BackgroundGradientHorizontal())
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


#Preview {
    TapView()
}
