//
//  ViewController.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/04/25.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var getEmail: UITextField!
    @IBOutlet weak var getPW: UITextField!
    
    @IBOutlet weak var button: UIButton!
    @IBAction func logInButtonClick(_ sender: Any) {
        guard let navigationpush = self.storyboard?.instantiateViewController(identifier: "mainView", creator: nil) as? MainViewController else {
            return
        }
        self.navigationController?.pushViewController(navigationpush, animated: true)

    }
    func layout(){
        self.button.layer.cornerRadius=24
        self.getEmail.placeholder="이메일"
        self.getPW.placeholder="비밀번호"
        self.getEmail.layer.cornerRadius=getEmail.frame.height/2
        self.getPW.layer.cornerRadius=22
        self.getEmail.delegate = self
        self.getPW.delegate = self
        self.getPW.isSecureTextEntry=true
    }
    @IBOutlet weak var goRegister: UILabel!
    @IBAction func registerButtonClick(_ sender: Any) {
        guard let gotoRegister = self.storyboard?.instantiateViewController(withIdentifier: "registerView") else {
            return
        }
        self.navigationController?.pushViewController(gotoRegister, animated: true)
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



}

