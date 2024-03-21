//
//  ListView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListView: View {
    
    // MARK: PROPERTIES
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var detens: PresentationDetent = .medium
    @State private var localItem: ItemModel?
    
    
    // MARK: BODY
    var body: some View {
        
        // foreground
        foregroundLayer
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
    
    /// This foreground holds to do items in a List.
    private var foregroundLayer: some View {
        List { // START: LIST
            ForEach(listViewModel.listItems) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        listViewModel.updateItemIsCompleted(item: item)
                    }
                    .contextMenu(menuItems: {
                        Button(action: {
                            localItem = item
                        }, label: {
                            Text("✏️ Edit")
                        })
                    })
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            .sheet(item: $localItem) { item in
                UpdateView(item: item)
                    .presentationDetents([.medium, .large], selection: $detens)
            }
        } // END: LIST
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

