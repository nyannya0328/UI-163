//
//  ContentView.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/16.
//

import SwiftUI

struct ContentView: View {
     @Namespace var animation
    @StateObject var ProfileVM = ProfileDetailModel()
    var body: some View {
     
        
        NavigationView{
            CustomPop(animation: animation)
                .environmentObject(ProfileVM)
        }
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

