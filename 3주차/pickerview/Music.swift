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
class Music: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
