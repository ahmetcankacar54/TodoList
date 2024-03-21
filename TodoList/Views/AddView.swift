//
//  AddView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 20.03.2024.
//

import SwiftUI

struct AddView: View {
    
    // MARK: PROPERTIES
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var listViewObject: ListViewModel
    @State var textFieldText: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = " "
    
    
    // MARK: BODY
    var body: some View {
        foregroundLayer
            .navigationTitle("Add an Item 🖋")
    }
    
    /// This is a foreground that holds a ScrollView.
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLVIEW
            VStack { // START: VSTACK
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
            } // END: VSTACK
            .padding(14)
            .alert(isPresented: $showAlert, content: getAlert)
        } // END: SCROLLVIEW
    }
    
    
    // MARK: FUNCTIONS
    
    /// Checks the textIsAppropriate is true or false. if it is true, this updates current item's title with textFieldText.
    ///
    /// This function checks the textFieldText and dismisses the view. if it is appropriate then assigns textFieldText to the item's title with listViewObject.updateItem function. The item will have a title based on the textFieldText value of "Hello there"
    /// ```
    /// saveButtonPressed() {
    ///  if textIsAppropriate(){
    ///     listViewObject.updateItem(item: ItemModel(id: item.id, title: "Hello there", item.isCompleted))
    ///     presentationMode.wrappedValue.dismiss()
    /// }
    /// ```
    ///
    /// Returns: Void()
    func saveButtonPressed() {
        if textIsAppropriate(){
            listViewObject.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    
    /// Checks textFieldText has more then 3 characters.
    ///
    /// This function checks textFieldText has more then 3 characters. The alert will have a message based on the parameter with a given title of "Oops".
    /// ```
    /// getAlert(message: "Hello There") -> Alert(title: "Oops", message: Text("Hello There"))
    /// ```
    ///
    /// - Returns: Boolean.
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "New todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    /// Gets an Alert with a specified title.
    ///
    /// This function creates and returns an alert without any logic immediately. The alert will have a message based on the parameter with a given title of "Oops".
    /// ```
    /// getAlert(message: "Hello There") -> Alert(title: "Oops", message: Text("Hello There"))
    /// ```
    ///
    /// - Parameter message: This is the title for the Alert.
    /// - Returns: Alert with title and message.
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
