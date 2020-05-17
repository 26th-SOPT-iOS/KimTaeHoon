//
//  ViewController.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/04/25.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    var id:String?
    var pw:String?
    var toggle = false
    private var isbuttonselected=false
    @IBOutlet weak var getEmail: UITextField!
    @IBOutlet weak var getPW: UITextField!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var AutoLogin: UIButton!
    @IBAction func AutoLoginClick(_ sender: UIButton) {
        self.isbuttonselected = !self.isbuttonselected
        if (isbuttonselected){
            self.AutoLogin.setImage(UIImage(named: "check_selected"), for: UIControl.State.normal)
        }
        else {
            self.AutoLogin.setImage(UIImage(named: "check_default"), for: UIControl.State.normal)

        }
    }
    
    @IBAction func logInButtonClick(_ sender: Any) {
        login()
    }
    func layout(){
        self.button.layer.cornerRadius=24
        self.getEmail.placeholder="아이디"
        self.getPW.placeholder="비밀번호"
        self.getEmail.layer.cornerRadius=22
        self.getPW.layer.cornerRadius=22
        self.getEmail.delegate = self
        self.getPW.delegate = self
        self.getPW.isSecureTextEntry=true
    }
    @IBOutlet weak var goRegister: UILabel!
    @IBAction func registerButtonClick(_ sender: Any) {
        guard let gotoRegister = self.storyboard?.instantiateViewController(identifier: "registerView") as? RegisterViewController else {return}
        gotoRegister.modalPresentationStyle = .fullScreen
        self.present(gotoRegister, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        self.layout()

        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        getLogInData()
        if let userID = UserDefaults.standard.string(forKey: "id") {
            if let UserPW = UserDefaults.standard.string(forKey: "pw"){
                guard let tabberController = self.storyboard?.instantiateViewController(identifier: "tabbarVC") as? tabbarController else {return}
                tabberController.modalPresentationStyle = .fullScreen
                self.present(tabberController, animated: true, completion: nil)
            }
        }else {return}
        
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

    private func getLogInData(){
        guard let id = self.id else{return}
        guard let pw = self.pw else{return}
        getEmail.text=id
        getPW.text=pw
        if toggle {
            login()
        }
    }
    private func login(){
        guard let inputID = getEmail.text else {return}
        guard let inputPW = getPW.text else {return}
        print(isbuttonselected)
        if (isbuttonselected){
            print("자동로그인")
            UserDefaults.standard.removeObject(forKey: "id")
            UserDefaults.standard.removeObject(forKey: "pw")
            UserDefaults.standard.set(self.getEmail.text,forKey: "id")
            UserDefaults.standard.set(self.getPW.text,forKey: "pw")
        }
        LoginService.shared.login(id: inputID, pwd: inputPW){ networkREsult in
            switch networkREsult{
            case .success(let token):
                guard let token = token as? String else {return}
                UserDefaults.standard.set(token,forKey: "token")
                guard let tabberController = self.storyboard?.instantiateViewController(identifier: "tabbarVC") as? tabbarController else {return}
                tabberController.modalPresentationStyle = .fullScreen
                self.present(tabberController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else {return}
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
                UserDefaults.standard.removeObject(forKey: "id")
                UserDefaults.standard.removeObject(forKey: "pw")
            case .pathErr : print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }


}

