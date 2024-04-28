//
//  SliderRepresentacion.swift
//  GuessingGame
//
//  Created by Denis Denisov on 28/4/24.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    
    @Binding var currentValue: Double
    var score: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.thumbTintColor = makeThumbColor(score)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderWasMoved),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = makeThumbColor(score)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
    private func makeThumbColor(_ score: Int) -> UIColor {
        UIColor.red.withAlphaComponent(CGFloat(score) / 100.0)
    }
}

extension SliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderWasMoved(_ slider: UISlider) {
            currentValue = Double(slider.value)
        }
    }
}

#Preview {
    SliderRepresentation(currentValue: .constant(60), score: 5)
}
