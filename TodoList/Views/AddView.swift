//
//  AddView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var listViewObject: ListViewModel
    @State var textFieldText: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = " "
    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add a new list item", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("save".uppercased())
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            .alert(isPresented: $showAlert, content: getAlert)
        }
        .navigationTitle("Add an Item 🖋")
    }
    
    func saveButtonPressed() {
        if textIsAppropriate(){
            listViewObject.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
            print("success")
        }
        
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "New todo item must be at least 3 characters long!!! 😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(content: {
            AddView()
        })
        .environmentObject(ListViewModel())
    }
}
