//
//  Music.swift
//  CollectionView
//
//  Created by 김태훈 on 2020/05/11.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

struct Music{
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(coverName: String,musicTitle:String, singer: String){
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = musicTitle
        self.singer = singer
    }
}

