//
//  Slider.swift
//  MoveTheSlider
//
//  Created by Aleksey Efimov on 15.05.2023.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var curentValue: Double
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(curentValue)
        uiView.thumbTintColor = UIColor(red: (200 / 255),
                                        green: (40 / 255),
                                        blue: (40 / 255),
                                        alpha: (CGFloat(alpha) / 100))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(curentValue: $curentValue)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var curentValue: Double
        
        init(curentValue: Binding<Double>) {
            self._curentValue = curentValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            curentValue = Double(sender.value)
        }
    }
}


struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(curentValue: .constant(30), alpha: 50)
    }
}
