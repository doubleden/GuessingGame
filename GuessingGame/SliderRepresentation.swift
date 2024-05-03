//
//  SliderRepresentacion.swift
//  GuessingGame
//
//  Created by Denis Denisov on 28/4/24.
//

import SwiftUI

struct SliderRepresentation: UIViewRepresentable {
    
    @Binding var currentValue: Double
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderWasMoved),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = currentValue.toFloat()
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
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

private extension Double {
    func toFloat() -> Float {
        Float(self)
    }
}

#Preview {
    SliderRepresentation(currentValue: .constant(60), alpha: 5)
}
