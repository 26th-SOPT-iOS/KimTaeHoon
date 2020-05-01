//
//  MainViewController.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/04/28.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBAction func goToLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scroll.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        // Do any additional setup after loading the view.
    }    
    @IBOutlet weak var imageheignt: NSLayoutConstraint!
    let scrollAmount:CGFloat = 210
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = self.scroll.contentOffset.y
        if y < 105 && y > -105{
            imageheignt.constant = scrollAmount-y
        }
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
