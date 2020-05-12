//
//  DetailViewController.swift
//  tableView2
//
//  Created by 김태훈 on 2020/05/11.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subTitilLabel: UILabel!
    var imageName:String=""
    var date:String=""
    var subTitle:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    private func initView(){
        weatherImageView.image=UIImage(named: imageName)
        dateLabel.text=date
        subTitilLabel.text = subTitle
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
