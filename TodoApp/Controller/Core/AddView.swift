//
//  AddView.swift
//  TodoApp
//
//  Created by Mehmet Vural on 21.03.2024.
//


import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var viewModel : ListViewModel
    @Environment(\.dismiss) var dismiss
    @State private var textField : String = ""
    @State private var showAlert : Bool = false
    @State private var setTitleAlert = "Some error"
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack{
                TextField("Type something in here", text: $textField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 15))

                
                
                Button(action: {
                    saveItem(title: textField)
                }, label: {
                    
                    Text("Save")
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.white)
                        .background(Color.accent)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                })
                
            }
            .alert(setTitleAlert, isPresented: $showAlert, actions: {
//                Button("Done", role: .destructive) {
//                    
//                }
            })
            .padding()
        }
        .navigationTitle("Add an item 🖌️")
    }
    func saveItem(title : String){
        if checkItem(){
            viewModel.add(title: title)
            dismiss()
        }
    }
    
    func checkItem() -> Bool {
        if self.textField.count < 3{
            
            setTitleAlert = "Your new todo item must be at least 3 chareacters long   💄💄💄 "
            showAlert.toggle()
            return false
        }
        
        return true
       
    }
}

#Preview {
    
    AddView()
    
}
