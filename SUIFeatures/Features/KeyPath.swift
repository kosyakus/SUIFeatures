//
//  KeyPath.swift
//  SUIFeatures
//
//  Created by Natalia Sinitsyna on 29.10.2024.
//



/// KeyPath — это возможность ссылаться на свойства объектов и структур без необходимости явно писать их имена.
/// Это полезно для создания гибких функций, работающих с динамическими данными.

import SwiftUI

struct Person {
    let name: String
    let age: Int
}

struct ShowKeyPath: View {
    
    let people = [
        Person(name: "Alice", age: 25),
        Person(name: "Bob", age: 30),
        Person(name: "Charlie", age: 22)
    ]
    
    @State private var sortedByAge: [Person] = []
    
    // Функция, которая сортирует массив по любому свойству с помощью KeyPath
    func sortBy<T>(array: [T], keyPath: KeyPath<T, Int>) -> [T] {
        return array.sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
    }
    
    var body: some View {
        VStack {
            Text("\(sortedByAge)")
                .font(.system(size: 26, weight: .medium))
                .padding()
            Button(action: {
                showKeyPath()
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
    
    func showKeyPath() {
        sortedByAge = sortBy(array: people, keyPath: \.age)
        print(sortedByAge) // Charlie, Alice, Bob
    }
}
/// Используя KeyPath, мы передаем свойство для сортировки как параметр


#Preview {
    ShowKeyPath()
}


/*
 
 struct Person {
     let name: String
     let age: Int
 }

 let person = Person(name: "Alice", age: 25)

 // Получаем имя с помощью keyPath
 let nameKeyPath = \Person.name
 print(person[keyPath: nameKeyPath]) // "Alice"

 // Получаем возраст с помощью keyPath
 let ageKeyPath = \Person.age
 print(person[keyPath: ageKeyPath]) // 25

 
 */
