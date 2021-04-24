//
//  RecentRowView.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/20.
//

import SwiftUI

struct RecentRowView: View {
    var recent : profile
    var animation : Namespace.ID
    @EnvironmentObject var ProfileVM : ProfileDetailModel
    var body: some View {
        HStack{
            
            
            Button(action: {
                
                ProfileVM.selectedProfile = recent
                ProfileVM.Showprofile.toggle()
                
            }, label: {
                ZStack{
                    
                    Image(recent.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    if !ProfileVM.Showprofile{
                        
                        Image(recent.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: recent.id, in: animation)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    
                }
                
                
                    
            })
                    .buttonStyle(PlainButtonStyle())
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            
                            Text(recent.username)
                                .fontWeight(.bold)
                            
                            Text(recent.lastmsg)
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        })
                        
                        Spacer()
                        
                        Text(recent.time)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    
                    Divider()
                    
                }
            
        }
        .padding(.horizontal)
    }
}

struct RecentRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
