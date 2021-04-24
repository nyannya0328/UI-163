//
//  StickyView.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/20.
//

import SwiftUI

struct StickyView: View {
    @Binding var firstMinY : CGFloat
    @Binding var minY : CGFloat
    @Binding var lastMinY : CGFloat
    
    @Binding var scale : CGFloat
    var body: some View {
        GeometryReader{reader -> AnyView in
            
            let minY = self.firstMinY - reader.frame(in: .global).minY
            
            let progress = (minY > 0 ? minY : 0) / 200
            
            let scale = (1 - progress) * 1
            
            let imageScale = (scale / 0.6) > 0.9 ? (scale / 0.6) : 0.9
            
            let imageOffset = imageScale > 0 ? (1 - imageScale) * 200 : 20
            
            DispatchQueue.main.async {
                if self.firstMinY == 0{
                    
                    self.firstMinY = reader.frame(in: .global)
                        .minY
                    
                }
                
                self.minY = minY//let
                if scale < 0.4 && lastMinY == 0{
                    
                    
                    self.lastMinY = minY
                    
                }
                self.scale = scale 
            }
            
         return AnyView(//return 忘れた
            
            Image("fuji")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getRect().width, height: getRect().height - firstMinY)
           
               .cornerRadius(1)
                .scaleEffect(scale < 0.6 ? imageScale : 1)//0.6
                .offset(y: scale < 0.6 ? imageOffset : 0)
              
                .overlay(
                    ZStack{
                        
                        VStack{
                            
                            Text("Create WebSite")
                                .font(.title)
                                .fontWeight(.bold)
                                .kerning(1.5)
                                
                            
                            Text("The Leader in\nWebsite desigin")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.top)
                                .multilineTextAlignment(.center)
                            
                            
                        }
                        .foregroundColor(.white)
                        .offset(y: 15)
                        .opacity(Double(scale - 0.7) / 0.3)
                        
                        Text("Japan Mountain")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .scaleEffect(1.5)
                            .opacity(0.1 - Double(scale - 0.7) / 0.3)
                    }
                    
                 
                
                )
                .background(
                    
                    ZStack{
                        
                        if scale < 0.6{
                            
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white.opacity(0.6))
                            
                            
                            VStack{
                                
                                HStack{
                                    
                                    Text("Fuji Man")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    
                                    ForEach(1...3,id:\.self){index in
                                        Circle()
                                            .fill(Color.green)
                                            .frame(width: 15, height: 15)
                                        
                                        
                                    }
                                    
                                    
                                    
                                }
                                .padding()
                                
                                Spacer()
                                
                            }
                                
                        }
                    
                    
                    
                })
                .scaleEffect(scale > 0.6 ? scale : 0.6)
                .offset(y: minY > 0 ? minY > lastMinY + 60  && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                .offset(y: scale > 0.6 ? (scale - 1) * 200 : -80)
                
         )
            
        }
        .frame(width: getRect().width, height: getRect().height - firstMinY)
        .overlay(
            VStack{
                
                Text("Wonderfull Mountain")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                
                NavigationLink(
                    destination: CuntryView(),
                    label: {
                        
                        Text("Get Start")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .padding(.horizontal,30)
                            .background(Color.white)
                            .cornerRadius(10)
                       
                    })
                
                
                    
                    
                    
                    
                    
              
                .padding(.top,10)
            }
            .padding(.bottom,70)
            .offset(y: minY > 0 ? minY > lastMinY + 60  && lastMinY != 0 ? lastMinY + 60 : minY : 0)
            
            ,alignment: .bottom
        
        
        )
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
