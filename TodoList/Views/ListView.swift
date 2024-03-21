//
//  ListView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var detens: PresentationDetent = .medium
    @State private var localItem: ItemModel?
    
    var body: some View {
            List {
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

