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
    @IBOutlet weak var getEmail: UITextField!
    @IBOutlet weak var getPW: UITextField!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var AutoLogin: UIButton!
    @IBAction func AutoLoginClick(_ sender: UIButton) {
        self.AutoLogin.setImage(UIImage(systemName: "circle"), for: UIControl.State.normal)
        self.AutoLogin.setImage(UIImage(systemName: "checkmark.circle"), for: UIControl.State.selected)
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
        guard let gotoRegister = self.storyboard?.instantiateViewController(withIdentifier: "registerView") else {
            return
        }
        self.navigationController?.pushViewController(gotoRegister, animated: true)
    }
    override func viewDidLoad() {
        self.layout()

        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        getLogInData()
        //guard let userID = UserDefaults.standard.string(forKey: "id")
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
        if (self.AutoLogin.isSelected){
            print("자동로그인")
            //UserDefaults.standard.set(self.getEmail,forKey: "id")
            //UserDefaults.standard.set(self.getPW,forKey: "pw")
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
            case .pathErr : print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }


}

