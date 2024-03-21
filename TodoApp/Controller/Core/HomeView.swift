//
//  HomeView.swift
//  TodoApp
//
//  Created by Mehmet Vural on 21.03.2024.
//

import SwiftUI

enum Screens : Hashable{
    
    case add
}



struct HomeView: View {
    
    @StateObject var viewModel : ListViewModel = ListViewModel()
    
    var body: some View{
        
        NavigationStack{
            
            List{
                ForEach(viewModel.items) { item  in
                    ListRowItemView(item: item)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                viewModel.update(item: item)
                            }
                        }
                }
                .onDelete(perform: viewModel.delete)
                .onMove(perform: viewModel.move)
            }
            .navigationTitle("Todo List🧾")
            .navigationDestination(for: Screens.self, destination: { value in
                AddView()
            })
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", value: Screens.add)
                    
                }
            }
        }
        .environmentObject(viewModel)
    }
    
}

#Preview {
    HomeView()
}
