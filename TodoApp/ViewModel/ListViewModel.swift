//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Mehmet Vural on 22.03.2024.
//

import Foundation


class ListViewModel : ObservableObject{
        
    @Published var items : [ItemModel] =  []{
        didSet{
            saveItems()
        }
    }
    
    let itemsKey : String = "items_list"
    
    init(){
    
        getItems()
    }
    
    func getItems(){
        
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey) ,
            let decodeData =  try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
 
        self.items = decodeData

    }
    
    func delete(indexSet : IndexSet){
        self.items.remove(atOffsets: indexSet)
    }
    
    func move(from  : IndexSet ,  to : Int ){
        self.items.move(fromOffsets: from, toOffset: to)
    }
    
    func add(title : String){
        let item = ItemModel(title: title, isCompleted: false)
        self.items.append(item)
    }
    func update(item : ItemModel){
        
        if let index =  self.items.firstIndex(where: { $0.id == item.id}){
            
            self.items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try?  JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey )
        }
    }
    
}
