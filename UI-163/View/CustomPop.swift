//
//  CustomPop.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/20.
//

import SwiftUI

struct CustomPop: View {
    var animation : Namespace.ID
    @EnvironmentObject var ProfileVM : ProfileDetailModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Whats UP!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                    .padding(.top)
                
                ForEach(recents){resent in
                    
                    RecentRowView(recent: resent, animation: animation)
                    
                    
                    
                }
                
                
                
                
            })
        })
        .overlay(
            ZStack(alignment:.top){
                
                if ProfileVM.Showprofile{
                    
                    ProfileDetatilView(animation: animation)
                    
                }
                
                
                
            }
        )
        .navigationBarHidden(true)
    }
}

struct CustomPop_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
