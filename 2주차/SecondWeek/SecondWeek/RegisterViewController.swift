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
        var message = "사용 가능한 이메일입니다."
        if (self.registerEmail.isEqual(self.mail)){
            message = "중복된 이메일입니다."
        }
        else{self.navigationController?.popViewController(animated: true)
        }
        
    }
    @IBAction func goBacktoLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func layout(){
        RegisterButton.layer.cornerRadius=24
        self.registerName.placeholder="이름"
        self.registerEmail.placeholder="이메일"
        self.registerPW.placeholder="비밀번호"
        registerEmail.layer.cornerRadius = 22
        registerPW.layer.cornerRadius=22
        registerName.layer.cornerRadius=22
        self.registerEmail.delegate = self
        self.registerPW.delegate = self
        self.registerPW.isSecureTextEntry=true
    }
    override func viewDidLoad() {

        self.layout()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
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
