//
//  ayment.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 11.05.2024.
//

import SwiftUI

struct CardFrontView: View {
    
    let creditCardInfo: CreditCardInfo
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .padding()
                Spacer()
                Text("VISA")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                    .italic()
                    .padding()
            }
            
            Text(creditCardInfo.cardNumber.isEmpty ? " " : creditCardInfo.cardNumber)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .padding()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("CARD HOLDER")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(creditCardInfo.cardHolderName.isEmpty ? " " : creditCardInfo.cardHolderName)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("EXPIRES")
                        .opacity(0.5)
                        .font(.system(size: 14))
                    Text(creditCardInfo.expirationDate.isEmpty ? " " : creditCardInfo.expirationDate)
                }
                
            }.padding()
            
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(width: 350, height: 250)
        .background(
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

struct CardBackView: View {
    
    let creditCardInfo: CreditCardInfo
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.black)
                .frame(maxWidth: .infinity, maxHeight: 22)
                .padding([.top], 20)
            Spacer()
            HStack {
                Text(creditCardInfo.ccvCode)
                    .frame(width: 100, height: 33, alignment: .center)
                    .background(.white)
                    .foregroundStyle(.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    ).padding([.leading, .trailing, .bottom], 20)
                Spacer()
            }
        }
        .foregroundStyle(.white)
        .frame(width: 350, height: 250)
        .background(
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}

struct CreditCardInfo {
    var cardHolderName = ""
    var cardNumber = ""
    var expirationDate = ""
    var ccvCode = ""
}

struct CheckoutFormView: View {
    
    @Binding var creditCardInfo: CreditCardInfo
    @FocusState var isCCVFocused: Bool
    let onCCVFocused: () -> Void
    
    var body: some View {
        Form {
            TextField("Cardholders name", text: $creditCardInfo.cardHolderName)
            TextField("Card number", text: $creditCardInfo.cardNumber)
            TextField("Expiry date", text: $creditCardInfo.expirationDate)
            TextField("CCV", text: $creditCardInfo.ccvCode)
                .focused($isCCVFocused)
        }.onChange(of: isCCVFocused) {
            onCCVFocused()
        }
    }
}

struct Payment: View {
    
    @State var creditCardInfo = CreditCardInfo()
    @State var flip: Bool = false
    @State var degrees: Double = 0
    
    var body: some View {
        ZStack {
            BackgroundGradientHorizontal()
            
            VStack {
                VStack {
                    if !flip {
                        CardFrontView(creditCardInfo: creditCardInfo)
                    } else {
                        CardBackView(creditCardInfo: creditCardInfo)
                    }
                }.rotation3DEffect(
                    .degrees(degrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                CheckoutFormView(creditCardInfo: $creditCardInfo) {
                    withAnimation {
                        degrees += 180
                        flip.toggle()
                    }
                }
            }.navigationTitle("Checkout")
        }
    }
}

#Preview {
    NavigationStack {
        Payment()
    }
}
