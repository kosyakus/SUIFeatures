//
//  OpaqueTypes.swift
//  SUIFeatures
//
//  Created by Natalia Sinitsyna on 29.10.2024.
//


/// Opaque Types (Непрозрачные типы)
/// Используется для указания типа результата функции, не раскрывая его конкретного типа.
/// Упрощает возврат типов из функций и скрывает внутреннюю реализацию.


import SwiftUI

protocol CalculableShape {
    func area() -> Double
}

struct Circle: CalculableShape, Shape {
    var radius: Double
    func area() -> Double {
        return .pi * radius * radius
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = CGFloat(radius * 2)
        let center = CGPoint(x: rect.midX - diameter / 2, y: rect.midY - diameter / 2)
        let circleRect = CGRect(origin: center, size: CGSize(width: diameter, height: diameter))
        return Path(ellipseIn: circleRect)
    }
}

struct ShowOpaqueTypes: View {
    
    @State private var showShape = false
    
    func createShape() -> some Shape {
        return Circle(radius: 100)
    }
    
    var body: some View {
        VStack {
            
            Button(action: {
                showShape.toggle()
            }) {
                Text("ShowOpaqueTypes")
                    .font(.system(size: 26, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            .padding(.bottom, 100)
            
            if showShape {
                createShape()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                    .padding()
            }
        }
    }
}
/// Использование some Shape позволяет нам скрыть конкретную реализацию Circle, возвращая объект как общий Shape.

#Preview {
    ShowOpaqueTypes()
}
