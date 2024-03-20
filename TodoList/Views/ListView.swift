//
//  ListView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
            List {
                ForEach(listViewModel.listItems) { item in
                    ListRowView(item: item)
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
            .navigationTitle("Todo List 📝")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddView(), label: {
                        Text("Add")
                    })
                }
            }
        
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            ListView()
        })
        .environmentObject(ListViewModel())
    }
}

