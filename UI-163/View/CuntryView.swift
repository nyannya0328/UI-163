//
//  CuntryView.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/17.
//

import SwiftUI

struct CuntryView: View {
    
    @State var selected = servers.first!
    
    @State var isServedon = false
    var body: some View {
        VStack{
            
            HStack{
                
                NavigationLink(
                    destination: RatingView(),
                    label: {
                        
                        Image(systemName: "circle.grid.3x3")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white.opacity(0.3),lineWidth: 0.5)
                            )
                        
                    })
                
              
                   
                
                    
                    Spacer()
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack(spacing:10){
                            
                            Image(systemName: "crown.fill")
                                .foregroundColor(.yellow)
                            
                            
                            Text("Go Premium")
                               
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                            
                            
                        }
                        .padding(.horizontal)
                        .padding(.vertical)
                        
                        .background(Color.black.opacity(0.2))
                        .clipShape(Capsule())
                    })
               
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing:15){
                    
                    ForEach(servers){server in
                        
                        Image(server.flag)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .onTapGesture {
                                
                                withAnimation{
                                    
                                    selected = server
                                }
                                
                            }
                            .padding(5)
                            .background(
                            
                            Circle()
                                .stroke(Color.white.opacity(selected.id == server.id ? 1 : 0),lineWidth: 2)
                            
                            )
                        
                    }
                    
                }
                .padding()
            })
            
            
            ZStack{
                
                Image("w")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: getRect().width - 40)
                    .cornerRadius(10)
                
                VStack(spacing:15){
                    
                    if isServedon{
                        
                        Text(selected.name)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    Text(isServedon ? "Connected" : "Not Connected")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    
                    if isServedon{
                        HStack{
                            
                            Image(selected.flag)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                            
                            Text("222,2222,22222")
                            
                        }
                        .foregroundColor(.white)
                    }
                }
                .offset(y: -20)
                
                
                
            }
            .padding(.vertical,25)
            
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: isServedon ? .bottom : .top), content: {
                
                
                
                Capsule()
                    .fill(isServedon ? Color.gray : Color.blue)
                
                VStack{
                    
                    if !isServedon{
                        
                        Spacer()
                    }
                    
                    
                    Image(systemName: "chevron.\(isServedon ? "up" : "down")")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    Image(systemName: "chevron.\(isServedon ? "up" : "down")")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color.white.opacity(0.7))
                    
                    if isServedon{
                        
                        Spacer()
                    }
                    
                    
                }
                .offset(y: isServedon ? 30 : -30)
                
                
                ZStack{
                    
                    Capsule()
                        .fill(isServedon ? Color.blue : Color.purple)
                        .frame(height: 180)
                        .padding(10)
                    
                    VStack{
                        
                        
                        Capsule()
                            .fill(isServedon ? Color.red : Color.green)
                            .frame(width: 30, height: 8)
                        
                        
                        Text(isServedon ? "Stop" : "Start")
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        
                        Image(systemName: "power")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    }
                }
                .onTapGesture {
                    withAnimation(.easeOut(duration: 0.6)){
                        isServedon.toggle()
                    }
                }
                
                
                
            })
            .frame(width: 130)
            .background(
            
                ZStack{
                    
                    Rings(width: getRect().width / 2, isservedon: $isServedon)
                        .offset(y: 70)
                    
                    Rings(width: getRect().width / 1.6, isservedon: $isServedon)
                        .offset(y: 80)
                    
                    Rings(width: getRect().width / 1.2, isservedon: $isServedon)
                        .offset(y: 90)
                    
                    Rings(width: getRect().width / 1.1, isservedon: $isServedon)
                        .offset(y: 100)
                    
                    Rings(width: getRect().width, isservedon: $isServedon)
                        .offset(y: 100)
                    
                }
            
            )
            
            .padding(.bottom,60)
            
            
           // Spacer()//これないと広がらない
        }
        .background(
        
            LinearGradient(gradient: .init(colors: [isServedon ? .blue : .red,Color(isServedon ? .green : .purple)]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
                .animation(.easeIn)
        )
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
    
   
}

struct CuntryView_Previews: PreviewProvider {
    static var previews: some View {
        CuntryView()
    }
}

func getSize(index : Int)->CGFloat{
    
    if index < 10 || index > 50 {return 3}
    
    if index >= 10 && index < 20{return 4}
    
    if index >= 40 && index <= 50 {return 4}
    
    else{
        
        return 5
    }
    
    
}

struct Rings : View {
    var width : CGFloat
    @Binding var isservedon : Bool
    var body: some View{
        
        ZStack{
            
            ForEach(1...60,id:\.self){index in
                
                
                Circle()
                    .fill(isservedon ? Color.green : Color.white)
                    .frame(width: getSize(index: index), height: getSize(index: index))
                    .offset(x: -(width / 2))
                    .rotationEffect(.init(degrees: Double(index * 6)))
                    .opacity(getSize(index: index) == 3 ? 0.7 : (isservedon ? 1 : 0.8))
                
            }
            
         
               
        }
        .frame(width: width)
        .rotationEffect(.init(degrees: 90))
    }
}


