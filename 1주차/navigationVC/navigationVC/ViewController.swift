//
//  ViewController.swift
//  navigationVC
//
//  Created by 김태훈 on 2020/04/21.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func purple(_ sender: Any) {
        guard let pushNext = self.storyboard?.instantiateViewController(withIdentifier: "purplescreen") else {return}
        self.navigationController?.pushViewController(pushNext, animated: true)
    }
    @IBAction func red(_ sender: Any) {
        guard let pushNext = self.storyboard?.instantiateViewController(withIdentifier: "redscreen") else {return}
        self.navigationController?.pushViewController(pushNext, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

