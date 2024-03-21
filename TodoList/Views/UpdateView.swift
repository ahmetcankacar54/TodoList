//
//  UpdateView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 21.03.2024.
//

import SwiftUI

struct UpdateView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var listViewObject: ListViewModel
    
   
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = " "
    
    @State private var textFieldText: String = ""
    let item: ItemModel
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                TextField(item.title, text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("update".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Spacer()
            }
            .padding(14)
        }
    }
    
    
    func saveButtonPressed() {
        if textIsAppropriate(){
            listViewObject.updateItem(item: ItemModel(id: item.id, title: textFieldText, isCompleted: item.isCompleted))
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Updated todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(item: ItemModel(title: "Update title", isCompleted: false))
            .environmentObject(ListViewModel())
    }
}
