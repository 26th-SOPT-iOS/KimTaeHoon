//
//  FriendList.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/05/12.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit
struct FriendList {
    var profile:UIImage?
    var name:String
    var message:String
    var profilename:String
    init(profilename:String,name:String,message:String){
        self.profilename=profilename
        self.profile=UIImage(named: profilename)
        self.name = name
        self.message=message
    }
}
