//
//  Server.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/17.
//

import SwiftUI

struct server : Identifiable {
    var id = UUID().uuidString
    var name : String
    var flag : String
}

var servers = [

    server(name: "イギリス", flag: "b"),
    server(name: "キューバ", flag: "c"),
    server(name: "スェーデン", flag: "h"),
    server(name: "日本", flag: "j"),
    server(name: "スイス", flag: "s"),
    server(name: "USA", flag: "USA"),
    
   
    
    

]
