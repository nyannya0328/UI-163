//
//  HeaderView.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/20.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        
        HStack{
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                
                   
            })
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.horizontal.3")
                    .font(.title)
                
                   
            })
            
            
            
            
        }
        .padding()
        .overlay(
        
        Text("MT.FUJI")
            .font(.title)
            .fontWeight(.heavy)
            .kerning(3)
        )
        .foregroundColor(.white)
        .padding(.top,getSafeArea().top)
        .background(Color("Color"))
        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.3), radius: 3 , x: -8, y: -8)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
