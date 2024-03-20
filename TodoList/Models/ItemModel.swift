//
//  ItemModel.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import Foundation

struct ItemModel: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
