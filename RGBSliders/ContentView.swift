//
//  ContentView.swift
//  RGBSliders
//
//  Created by Alexey Khestanov on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var red: (val: Double, str: String) = (128.0, "128")
    @State var green: (val: Double, str: String) = (128.0, "128")
    @State var blue: (val: Double, str: String) = (128.0, "128")

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.init(
                    .sRGB,
                    red: red.val / 255,
                    green: green.val / 255,
                    blue: blue.val / 255
                ))
            Spacer()
            SliderGroup(
                color: .red,
                range: 0...255,
                str: $red.str,
                value: $red.val
            )
            SliderGroup(
                color: .green,
                range: 0...255,
                str: $green.str,
                value: $green.val
            )
            SliderGroup(
                color: .blue,
                range: 0...255,
                str: $blue.str,
                value: $blue.val
            )
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
