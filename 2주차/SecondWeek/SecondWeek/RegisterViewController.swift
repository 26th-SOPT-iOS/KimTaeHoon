//
//  RegisterViewController.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/04/28.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var registerName: UITextField!
    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var registerPW: UITextField!
    
    let mail = "st939823@gmail.com"
    @IBOutlet weak var RegisterButton: UIButton!
    @IBAction func registerButtonClick(_ sender: Any) {
        if (self.registerEmail.isEqual(self.mail)){
            
        }
        else{self.navigationController?.popViewController(animated: true)
        }
    }
    func layout(){
        self.RegisterButton.layer.cornerRadius=24
        self.registerName.placeholder="이름"
        self.registerEmail.placeholder="이메일"
        self.registerPW.placeholder="비밀번호"
        self.registerEmail.layer.cornerRadius = 220
        self.registerPW.layer.cornerRadius=220
        self.registerEmail.delegate = self
        self.registerPW.delegate = self
        self.registerPW.isSecureTextEntry=true
    }
    override func viewDidLoad() {

        self.layout()
        super.viewDidLoad()

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
