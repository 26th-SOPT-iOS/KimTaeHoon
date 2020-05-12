//
//  MusicCell.swift
//  CollectionView
//
//  Created by 김태훈 on 2020/05/11.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit


class MusicCell: UICollectionViewCell {
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    static let identifier:String="MusicCell"
    
    func set(_ musicInformation: Music){
        albumImageView.image=musicInformation.albumImg
        titleLabel.text = musicInformation.musicTitle
        singerLabel.text = musicInformation.singer
    }
}
