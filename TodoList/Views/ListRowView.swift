//
//  ListRowView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct ListRowView: View {
    
    @State var listText: String
    
    @State var listItemIsChecked: Bool = false
    
    var body: some View {
        HStack {
            Text(listText)
            Spacer()
            Image(systemName: listItemIsChecked ? "checkmark.circle" : "circle")
                .onTapGesture {
                    listItemIsChecked.toggle()
                }
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listText: "Example Text")
    }
}
