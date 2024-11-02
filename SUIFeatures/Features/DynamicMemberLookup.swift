//
//  DynamicMemberLookup.swift
//  SUIFeatures
//
//  Created by Natalia Sinitsyna on 29.10.2024.
//



/// Этот атрибут позволяет обращаться к свойствам объекта по имени, которое определяется в рантайме.
/// Особенно полезен при работе с JSON или динамическими объектами.

import SwiftUI

@dynamicMemberLookup
struct JSONWrapper {
    private var data: [String: Any]

    init(data: [String: Any]) {
        self.data = data
    }

    subscript(dynamicMember member: String) -> Any? {
        return data[member]
    }
}


struct ShowDynamicMemberLookup: View {
    
    let json = JSONWrapper(data: ["name": "Alice", "age": 25])
    @State private var showDynamicMember = false
    
    var body: some View {
        VStack {
            Button(action: {
                showDynamicMember.toggle()
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
            
            if showDynamicMember {
                Text("\(json.name ?? "") \(json.age ?? "")")
                    .font(.system(size: 26, weight: .medium))
                    .padding()
            }
        }
    }
    
    func showDynamicMemberLookup() {
        print(json.name ?? "") // Alice
        print(json.age ?? "") // 25
    }
}
/// @dynamicMemberLookup позволяет нам обращаться к элементам словаря как к обычным свойствам

#Preview {
    ShowDynamicMemberLookup()
}
