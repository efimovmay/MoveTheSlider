//
//  Slider.swift
//  MoveTheSlider
//
//  Created by Aleksey Efimov on 15.05.2023.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    @Binding var curentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0.0
        slider.minimumValue = 100.0
        slider.thumbTintColor = .red
        slider.thumbTintColor = UIColor(white: 100, alpha: 100)


        
//        slider.addTarget(
//            context.coordinator,
//            action: #selector(Coordinator.valueChanged),
//            for: .valueChanged
//        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(curentValue)
    }
    
    
}


struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(curentValue: .constant(1.0))
    }
}
