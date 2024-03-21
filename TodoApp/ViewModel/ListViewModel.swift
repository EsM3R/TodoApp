//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Mehmet Vural on 22.03.2024.
//

import Foundation


class ListViewModel : ObservableObject{
        
    @Published var items : [ItemModel] =  []
    
    init(){
    
        getItems()
    }
    
    func getItems(){
        
        let items  : [ItemModel ] = [
            .init(title: "First Todo", isCompleted: false),
            .init(title: "Second Todo", isCompleted: true),
            .init(title: "third Todo", isCompleted: true)
        ]
        
        self.items.append(contentsOf: items)

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
    
}
