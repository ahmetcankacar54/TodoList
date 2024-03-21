//
//  ListViewModel.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var listItems: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        self.listItems = savedItems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(listItems) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

}
