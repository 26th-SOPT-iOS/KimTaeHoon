//
//  LoginViewController.swift
//  fisrtWeek
//
//  Created by 김태훈 on 2020/04/20.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var myID: UILabel!
    @IBOutlet weak var myPW: UILabel!
    
    var id: String?
    var pw: String?
    
    private func getLogInData(){
        guard let id = self.id else{return}
        guard let pw = self.pw else{return}
        
        myID.text=id
        myPW.text=pw
    }
    @IBAction func logOutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getLogInData()

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
