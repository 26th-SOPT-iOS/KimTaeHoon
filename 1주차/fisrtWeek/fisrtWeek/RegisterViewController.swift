//
//  RegisterViewController.swift
//  fisrtWeek
//
//  Created by 김태훈 on 2020/04/20.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var registerID: UITextField!
    @IBOutlet weak var registerPW: UITextField!
    @IBAction func registerButotn(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController", creator: nil) as? LoginViewController else {return}
        receiveViewController.id=registerID.text
        receiveViewController.pw=registerPW.text
        self.present(receiveViewController,animated: true){
            self.navigationController?.popViewController(animated: false)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerID.delegate=self
        self.registerPW.delegate=self
        self.registerPW.isSecureTextEntry=true
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
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
