//
//  Music.swift
//  pickerview
//
//  Created by 김태훈 on 2020/05/09.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit


struct Music{
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(title:String, singer: String, coverName: String){
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}
