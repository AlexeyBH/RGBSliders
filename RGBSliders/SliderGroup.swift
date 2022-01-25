//
//  SliderGroup.swift
//  RGBSliders
//
//  Created by Alexey Khestanov on 25.01.2022.
//

import SwiftUI

struct SliderGroup: View {

    let color: Color
    let range: ClosedRange<Double>

    @Binding var str: String
    @Binding var value: Double
    
    @State var isAlertPresented = false
    @FocusState private var isFocused: Bool

    private let scrWidth = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            slider
                .accentColor(color)
                .frame(
                    width: scrWidth * 0.75,
                    height: scrWidth / 30,
                    alignment: .leading
                )
            Spacer()
            textField
                .alert("Bad input", isPresented: $isAlertPresented)
            {
                Button("Ok") {
                    changedSlider(false)
                }
            }
        }
        .padding()
    }
    
    private var slider: some View {
        Slider(
            value: $value,
            in: range,
            step: 1,
            onEditingChanged: changedSlider
        )
    }
    
    private func changedText() -> Void {
        guard let newVal = Double(str),
              newVal >= range.lowerBound,
              newVal > range.upperBound
        else {
            isAlertPresented = true
            return
        }
        if newVal != value {
            value = newVal
        }
        isFocused = false
    }
    
    private var textField: some View {
        TextField("", text: $str)
            .foregroundColor(color)
            .focused($isFocused)
            .onSubmit { changedText() }
            .keyboardType(.numberPad)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Button("Done") { changedText() }
                    }
                }
            }
    }
    
    private func changedSlider(_: Bool) -> Void {
        let newStr = String(Int(value))
        if newStr != str {
            str = newStr
        }
    }
    
}

struct SliderGroup_Previews: PreviewProvider {
    static var previews: some View {
        SliderGroup(
            color: .green,
            range: 0.0...255.0,
            str: .constant("100"),
            value: .constant(100)
        )
    }
}


///
