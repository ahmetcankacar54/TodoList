//
//  UpdateView.swift
//  TodoList
//
//  Created by Ahmet Kaçar on 21.03.2024.
//

import SwiftUI

struct UpdateView: View {
    
    //
    enum UpdateFields {
    case itemTitle
    }
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var listViewObject: ListViewModel
    
   
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = " "
    
    @State private var textFieldText: String = ""
    @FocusState private var fieldInFocus: UpdateFields?
    let item: ItemModel
    
    
    // MARK: BODY

    var body: some View {
        ZStack { // START: ZSTACK
            // background
            Color.clear.ignoresSafeArea()
            
            // foreground
            foregroundLayer
                .padding(14)
        } // END: ZSTACK
    }
    
    
    /// This is a foreground layer that holds VStack with a custom textfield and button.
    private var foregroundLayer: some View {
        VStack { // START: VSTACK
            TextField(item.title, text: $textFieldText)
                .focused($fieldInFocus, equals: .itemTitle)
                .padding()
                .frame(height: 55)
                .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
                .cornerRadius(10)
                .onAppear {
                    fieldInFocus = .itemTitle
                }
            
            Button(action: updateButtonPressed, label: {
                Text("update".uppercased())
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            })
            Spacer()
        } // END: VSTACK
    }
    
    
    // MARK: FUNCTIONS
    
    /// Checks the textIsAppropriate is true or false. if it is true, this updates current item's title with textFieldText.
    ///
    /// This function checks the textFieldText and dismisses the view. if it is appropriate then assigns textFieldText to the item's title with listViewObject.updateItem function. The item will have a title based on the textFieldText value of "Hello there"
    /// ```
    /// updateButtonPressed() {
    ///  if textIsAppropriate(){
    ///     listViewObject.updateItem(item: ItemModel(id: item.id, title: "Hello there", item.isCompleted))
    ///     presentationMode.wrappedValue.dismiss()
    /// }
    /// ```
    ///
    /// Returns: Void()
    func updateButtonPressed() {
        if textIsAppropriate(){
            listViewObject.updateItem(item: ItemModel(id: item.id, title: textFieldText, isCompleted: item.isCompleted))
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
            alertTitle = "Updated todo item must be at least 3 characters long!!! 😨😰😱"
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

// MARK: PREVIEW

struct UpdateView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateView(item: ItemModel(title: "Update title", isCompleted: false))
            .environmentObject(ListViewModel())
    }
}
