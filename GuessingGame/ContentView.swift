//
//  ContentView.swift
//  GuessingGame
//
//  Created by Denis Denisov on 27/4/24.
//

import SwiftUI

struct ContentView: View {
    private let targetValue = Int.random(in: 0...100)
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Передвиньте слайдер, как можно ближе к: \(targetValue)")
                .font(.callout)
            
            Text("Slider")
            
            Button("Проверь меня!", action: {})
            Button("Начать заново", action: {})
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
