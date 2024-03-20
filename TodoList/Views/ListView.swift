//
//  ListView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListView: View {
    
    @State var listItems: [String] = [
        "List item numero uno",
        "List item numero secundo",
        "List item numero tres"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listItems, id: \.self) { listItem in
                    ListRowView(listText: listItem)
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

