//
//  ContentView.swift
//  GuessingGame
//
//  Created by Denis Denisov on 27/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue = Int.random(in: 0...100)
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
                .alert("Ваш счет", isPresented: $isPresented, actions: {}) {
                    Text(computeScore().formatted())
                }
            
            Button("Начать заново") {
               
            }
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
