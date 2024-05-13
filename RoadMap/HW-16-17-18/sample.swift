//
//  sample.swift
//  RoadMap
//
//  Created by Adlet Zhantassov on 12.05.2024.
//

import SwiftUI

struct sample: View {
    @State private var selectedDate = Date()
    @State private var isDatePickerShown = false
    
    var body: some View {
        VStack {
                    TextField("Select a date", value: $selectedDate, formatter: dateFormatter)
                        .onTapGesture {
                            isDatePickerShown.toggle()
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .disabled(true)
                    
                    if isDatePickerShown {
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle()) // Можно использовать другие стили, например, CompactDatePickerStyle()
                            .labelsHidden() // Скрыть метку для DatePicker
                            .padding()
                    }
                    
                    Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                        .padding()
                    
                    Spacer()
                }
    }
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter
        }()
}

#Preview {
    sample()
}
