//
//  ListView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListView: View {
    
    @State var listItems: [ItemModel] = [
        ItemModel(title: "List item numero uno", isCompleted: false),
        ItemModel(title: "List item numero dos", isCompleted: false),
        ItemModel(title: "List item numero tres", isCompleted: false),
        ItemModel(title: "List item numero quattro", isCompleted: false),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listItems) { listItem in
                    ListRowView(item: listItem)
                }
            }
            .navigationTitle("Todo List 📝")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddView(listItems: $listItems), label: {
                        Text("Add")
                    })
                }
            }
        }
        
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

