//
//  ContentView.swift
//  GuessingGame
//
//  Created by Denis Denisov on 27/4/24.
//

import SwiftUI

struct ContentView: View {
    private let targetValue = Int.random(in: 0...100)
    @State var currentValue = Double.random(in: 0...100)
    @State var isPresented = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Передвиньте слайдер, как можно ближе к: \(targetValue)")
                .font(.callout)
            
            SliderRepresentation(
                currentValue: $currentValue,
                score: computeScore()
            )
            
            Button("Проверь меня!", action: { isPresented.toggle() })
                .alert("Ващ счет: \(computeScore())", isPresented: $isPresented, actions: {})
            
            Button("Начать заново", action: {})
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
