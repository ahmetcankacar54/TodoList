//
//  ListRowView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListRowView: View {
    
    // MARK: PROPERTIES
    
    let item: ItemModel
    
    
    // MARK: BODY
    var body: some View {
        
        // foreground
        HStack {
            Text(item.title)
            Spacer()
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .black)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title: "Example title ", isCompleted: false))
    }
}
