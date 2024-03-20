//
//  ListRowView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListRowView: View {
    
    @State var item: ItemModel
    
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .black)
                .onTapGesture {
                    
                }
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item: ItemModel(title: "sample title ", isCompleted: false))
    }
}

