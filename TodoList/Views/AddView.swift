//
//  AddView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    @Binding var listItems: [ItemModel]
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add a new list item", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action: {
                    listItems.append(ItemModel(title: textFieldText, isCompleted: false))
                }, label: {
                    Text("save".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋")
    }
}


