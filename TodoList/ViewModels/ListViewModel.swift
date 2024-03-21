//
//  ListViewModel.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var listItems: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [ItemModel(title: "List item numero uno", isCompleted: false),
                        ItemModel(title: "List item numero dos", isCompleted: false),
                        ItemModel(title: "List item numero tres", isCompleted: true),
                        ItemModel(title: "List item numero quattro", isCompleted: false),]
        
        self.listItems.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    
    func moveItem(move: IndexSet, to: Int) {
        listItems.move(fromOffsets: move, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        listItems.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = listItems.firstIndex(where: { $0.id == item.id }) {
            listItems[index] = item.updateCompletion()
        }
    }
    
    func updateItemIsCompleted(item: ItemModel) {
        if let index = listItems.firstIndex(where: { $0.id == item.id }) {
            listItems[index] = item.updateIsCompletedCompletion()
        }
    }

}
