//
//  Home.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/20.
//

import SwiftUI



struct Home: View {
    @State var firstMinY : CGFloat = 0
    @State var minY : CGFloat = 0
    @State var lastMinY : CGFloat = 0
    @State var scale : CGFloat = 0
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        VStack(spacing:0){
            
         HeaderView()
            
            ScrollView(showsIndicators: false, content: {
                
                StickyView(firstMinY: $firstMinY, minY: $minY, lastMinY: $lastMinY, scale: $scale)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    ForEach(subTitle,id:\.self){text in
                        
                        Section(header: Text(text)
                                
                                    .font(.title)
                                    .fontWeight(.bold)
                        
                        ) {
                            
                            
                            Text("Mount Fuji (富士山, Fujisan, Japanese: [ɸɯꜜ(d)ʑisaɴ] (About this soundlisten)), located on the island of Honshū, is the highest mountain in Japan, standing 3,776.24 m (12,389.2 ft). It is the second-highest volcano located on an island in Asia (after Mount Kerinci on the island of Sumatra), and seventh-highest peak of an island on Earth.[1] Mount Fuji is an active stratovolcano that last erupted from 1707 to 1708.[4][5] The mountain is located about 100 km (62 mi) southwest of Tokyo and is visible from there on clear days. Mount Fuji's exceptionally symmetrical cone, which is covered in snow for about five months of the year, is commonly used as a cultural icon of Japan and it is frequently depicted in art and photography, as well as visited by sightseers and climbers.[6]Mount Fuji is one of Japans Three Holy Mountains (三霊山, Sanreizan) along with Mount Tate and Mount Haku It is a Special Place of Scenic Beauty and one of Japans Historic Sites.[7] It was added to the World Heritage List as a Cultural Site on June 22, 2013.[7] According to UNESCO, Mount Fuji has inspired artists and poets and been the object of pilgrimage for centuries.UNESCO recognizes 25 sites of cultural interest within the Mount Fuji localityThese 25 locations include the mountain and the Shinto shrine, Fujisan Hongū Sengen Taishaas well as the Buddhist Taisekiji Head Temple founded in 1290, later depicted by Japanese ukiyo-e artist Katsushika Hokusai.")
                            
                            //)最後の
                            
                            
                            
                            
                            
                                
                                
                                
                              
                                
                                
                                
                              
                            
                        }
                        
                        
                    }
                })
                .padding()
                .padding(.bottom,lastMinY)
                .background(Color.white)
                .offset(y: scale > 0.4 ? minY : lastMinY)
              
                
            })
            
           
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color("Color").ignoresSafeArea(.all, edges: .all))
        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

let subTitle = ["Tiger Amazing","Tiger Fear","Sumatra","Carnivorous","Wonderful"]


