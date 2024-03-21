//
//  ListRowItemView.swift
//  TodoApp
//
//  Created by Mehmet Vural on 21.03.2024.
//

import SwiftUI

struct ListRowItemView: View {
    
    let item : ItemModel
    
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.square" : "square")
                .renderingMode(.template)
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text("\(item.title)")
            Spacer()
        }
        .font(.system(.title2 , design: .rounded))
    }
}

#Preview {
    ListRowItemView(item: developerItem)
}


let developerItem = ItemModel(title: "Test", isCompleted: true)
