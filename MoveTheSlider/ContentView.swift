//
//  ContentView.swift
//  MoveTheSlider
//
//  Created by Aleksey Efimov on 14.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var valueSlider: Double = 0
    @State private var targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            Slider(value: $valueSlider, in: 0...100)
            Button("Проверь меня!") {
                
            }
            Button("Начать заново") {
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//private func computeScore() -> Int {
//    let difference = abs(targetValue - lround(currentValue))
//    return 100 - difference
//}
