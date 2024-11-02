//
//  PropertyWrappers.swift
//  SUIFeatures
//
//  Created by Natalia Sinitsyna on 29.10.2024.
//


/// Обертки для свойств
/// Позволяют добавлять функциональность к свойствам. `@State`, `@Binding` и других
/// Упрощающают управление состоянием.

import SwiftUI

@propertyWrapper
struct Capitalized {
    private var value: String = ""

    var wrappedValue: String {
        get { value.uppercased() }
        set { value = newValue }
    }
}

struct User {
    @Capitalized var name: String
}


struct ShowPropertyWrappers: View {
    
    @State var user = User()
    
    var body: some View {
        VStack {
            Text("\(user.name)")
                .font(.system(size: 26, weight: .medium))
                .padding()
            Button(action: {
                showPropertyWrappers()
            }) {
                Text("ShowPropertyWrappers")
                    .font(.system(size: 26, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
    }
    
    func showPropertyWrappers() {
        user.name = "alice"
        print(user.name) // ALICE
    }
}
/// Свойство name автоматически преобразуется к верхнему регистру благодаря обертке Capitalized

#Preview {
    ShowPropertyWrappers()
}
