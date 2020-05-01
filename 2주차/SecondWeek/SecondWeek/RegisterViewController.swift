//
//  RegisterViewController.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/04/28.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var giveInfo: UILabel!
    @IBOutlet weak var registerName: UITextField!
    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var registerPW: UITextField!
    
    @IBOutlet weak var checkbutoon: UIButton!
    let mail = "st939823@gmail.com"
    @IBOutlet weak var RegisterButton: UIButton!
    @IBAction func checkEmail(_ sender: Any) {
        var message:String?
        if (self.registerEmail.isEqual(self.mail)){
            message = "중복된 이메일입니다."
            checkbutoon.setImage(UIImage(named: "idcheckRedIc"), for: .normal)
        }
        else{
            checkbutoon.setImage(UIImage(named: "idcheckGreenIc"), for: .normal)
            message = "사용 가능한 이메일입니다."
        }
        giveInfo.text = message
    }
    
    @IBAction func registerButtonClick(_ sender: Any) {
        if (!self.registerEmail.isEqual(self.mail)){
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    @IBAction func goBacktoLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func layout(){
        let redius:CGFloat = 22.0
        RegisterButton.layer.cornerRadius=24
        self.giveInfo.layer.cornerRadius=redius
        self.registerName.placeholder="  이름"
        self.registerEmail.placeholder="  이메일"
        self.registerPW.placeholder="  비밀번호"
        registerEmail.layer.cornerRadius = redius
        registerPW.layer.cornerRadius=redius
        registerName.layer.cornerRadius=redius
        self.registerName.layer.masksToBounds=true
        self.registerEmail.delegate = self
        self.registerPW.delegate = self
        self.registerEmail.layer.masksToBounds=true
        self.registerPW.layer.masksToBounds=true
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
