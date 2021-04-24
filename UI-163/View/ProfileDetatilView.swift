//
//  ProfileDetatilView.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/20.
//

import SwiftUI

struct ProfileDetatilView: View {
    @EnvironmentObject var ProfileVM : ProfileDetailModel
    @GestureState var  offset : CGFloat = 0
    var animation : Namespace.ID
    var body: some View {
        ZStack(alignment:.top){
            
            if ProfileVM.selectedProfile != nil{
                
                if ProfileVM.showEnlargedImage{
                    
                    Image(ProfileVM.selectedProfile.profile)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: ProfileVM.selectedProfile.id, in: animation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .offset(y: ProfileVM.offset)
                        .gesture(DragGesture().updating($offset, body: { (value, out, _) in
                            out = value.translation.height
                        }).onEnded({ (value) in
                            let offset = ProfileVM.offset > 0 ? ProfileVM.offset : -ProfileVM.offset
                            
                            withAnimation{
                                
                                if offset > 200{
                                    
                                    ProfileVM.Showprofile.toggle()
                                    ProfileVM.showEnlargedImage.toggle()
                                    
                                    ProfileVM.selectedProfile = nil
                                   
                                    
                                    
                                }
                                ProfileVM.offset = 0
                                
                                
                            }
                            
                        }))
                      
                        .background(
                        
                            Color.black.opacity(getOpacity())
                                .ignoresSafeArea()
                        
                        )
                    HStack{
                        
                        
                        Button(action: {
                            
                            withAnimation{
                                ProfileVM.showEnlargedImage.toggle()
                                ProfileVM.Showprofile.toggle()
                                
                                ProfileVM.selectedProfile = nil
                            }
                            
                        }, label: {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                           
                            
                        })
                        
                        Text(ProfileVM.selectedProfile.username)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: "Text\(ProfileVM.selectedProfile.id)", in: animation)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                }
                
                else{
                    
                    Button(action: {
                        
                        withAnimation(.easeInOut){
                            
                            ProfileVM.showEnlargedImage.toggle()
                            
                        }
                        
                        
                    }, label: {
                        Image(ProfileVM.selectedProfile.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(TitleView(animation: animation, recent: ProfileVM.selectedProfile),alignment: .top)
                    })
                        .overlay(ButtonActions().offset(y: 50),alignment: .bottom)
                        .frame(width: 300, height: 300)
                        .matchedGeometryEffect(id: ProfileVM.selectedProfile.id, in: animation)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(
                            
                            Color.primary.opacity(0.2).ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation{
                                        
                                        
                                        ProfileVM.Showprofile.toggle()
                                        ProfileVM.selectedProfile = nil
                                    }
                                }
                        
                        )
                }
                
               
            }
        }
        .onChange(of: offset, perform: { value in
            ProfileVM.offset = offset
        })
    }
    
    func getOpacity()->Double{
        
        let offset = ProfileVM.offset > 0 ? ProfileVM.offset : -ProfileVM.offset
        
        let progress = offset / 200
        
        return 1 - Double(progress)
        
    }
}

struct ProfileDetatilView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }
}

struct TitleView : View {
    @EnvironmentObject var ProfileVM : ProfileDetailModel
    var animation : Namespace.ID
    
    var recent : profile
    var body: some View{
        
        Text(recent.username)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .matchedGeometryEffect(id: "Text\(recent.id)", in: animation)
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(1)
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.3))
        
        
        
    }
}

struct ButtonActions : View {
    
    
    var body: some View{
        
        
        HStack{
            
            
          NavigationLink(
            destination: Home(),
            label: {
                Image(systemName: "message.fill")
                    .font(.title2)
                    .foregroundColor(.green)
            })
                
                
                
           
             
           
            
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "info.circle.fill")
                    .font(.title2)
                    .foregroundColor(.green)
            })
            
            

        }
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.white)
        
    }
}
