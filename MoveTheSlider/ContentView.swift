//
//  ContentView.swift
//  MoveTheSlider
//
//  Created by Aleksey Efimov on 14.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Double = 0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack(spacing: 10) {
                Text("0")
                CustomSlider(curentValue: $currentValue)
                Text("100")
            }
            Button("Проверь меня!") {
                showingAlert = true
            }
            .alert(isPresented: $showingAlert) {
                let score = computeScore(targetValue, currentValue)
                return Alert(
                    title: Text("Your Score"),
                    message: Text("\(score)"),
                    dismissButton: .default(Text("OK"))
                    )
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
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

private func computeScore(_ targetValue: Int, _ currentValue: Double ) -> Int {
    let difference = abs(targetValue - lround(currentValue))
    return 100 - difference
}
