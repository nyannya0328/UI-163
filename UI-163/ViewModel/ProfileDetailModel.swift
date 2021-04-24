//
//  ProfileDetailModel.swift
//  UI-163
//
//  Created by にゃんにゃん丸 on 2021/04/20.
//

import SwiftUI

class ProfileDetailModel: ObservableObject {
    @Published var Showprofile = false
    @Published var selectedProfile : profile!
    
    @Published var showEnlargedImage = false
    @Published var offset : CGFloat = 0
}

