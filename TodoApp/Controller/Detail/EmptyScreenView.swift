//
//  EmptyScreenView.swift
//  TodoApp
//
//  Created by Mehmet Vural on 22.03.2024.
//

import SwiftUI

struct EmptyScreenView: View {
    
    @State private var isAnimating : Bool = false
    var body: some View {
        
        VStack(spacing : 10){
            
            Text("There are no items!")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Are you productive person ? I think  you should click the add button and add a bunch of items to your todo lists" )
                .padding(.bottom , 15)
            
            
            NavigationLink(value: Screens.add) {
                Text("Add Something 🤓")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(isAnimating ? Color.secondaryAccent : Color.accent )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal , isAnimating ? 30 :  50)
                    .shadow(color :isAnimating ? Color.secondaryAccent.opacity(0.7) : Color.accent.opacity(0.7),
                            radius:isAnimating ?  30 : 10 ,
                            x : 0,
                            y : isAnimating ?  50 : 30 )
                    .scaleEffect(isAnimating ? 1.2 : 1)
              
                    .offset(y : isAnimating ?  7 : 0)
            }
            
            Spacer()
            
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .frame(maxWidth: 400 , maxHeight: .infinity)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation(){
        guard !isAnimating else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation (Animation.easeInOut(duration: 2).repeatForever()) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    EmptyScreenView()
}
