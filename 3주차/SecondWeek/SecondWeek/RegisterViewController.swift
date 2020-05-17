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
    @IBOutlet weak var registerID: UITextField!
    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var registerPW: UITextField!
    @IBOutlet weak var registerPhoneNumber: UITextField!
    @IBOutlet weak var registerName: UITextField!
    
    
    
    @IBOutlet weak var RegisterButton: UIButton!
    
    @IBAction func registerButtonClick(_ sender: Any) {
        guard let inputRegisterID = registerID.text else {return}
        guard let inputRegisterName = registerName.text else {return}
        guard let inputPW = registerPW.text else {return}
        guard let inputEmail = registerEmail.text else {return}
        guard let inputPhone = registerPhoneNumber.text else {return}

        var err=""
        
        RegisterService.registershared.register(id: inputRegisterID, pwd: inputPW, name: inputRegisterName,email:inputEmail,phone:inputPhone) {networkResult in
        switch networkResult {
            case .success(let message):
                guard let message = message as? String else {return}
                self.giveInfo.text = message
                self.giveInfo.alpha = 1
                UIView.animate(withDuration: 1, animations: ({self.giveInfo.alpha=0}))
                guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC") as? ViewController else {return}
                loginVC.id = inputRegisterID
                loginVC.pw = inputPW
                loginVC.toggle = true
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: true, completion: nil)
        case .exitingIDErr(let message):
                guard let message = message as? String else {return}
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr : err = "Path Error"
            case .serverErr: err = "Server Error"
            case .networkFail: err = "network Error"
            }
            if(err != ""){
                self.giveInfo.text = err
                self.giveInfo.alpha = 1
                UIView.animate(withDuration: 1, animations: ({self.giveInfo.alpha = 0}))
            }
        }
        
    }
    @IBAction func goBacktoLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func layout(){
        let redius:CGFloat = 22.0
        RegisterButton.layer.cornerRadius=24
        self.giveInfo.layer.cornerRadius=redius
        self.registerID.placeholder="아이디"
        self.registerName.placeholder="이름"
        self.registerEmail.placeholder="이메일"
        self.registerPW.placeholder="비밀번호"
        self.registerPhoneNumber.placeholder="전화번호"
        registerEmail.layer.cornerRadius = redius
        registerPW.layer.cornerRadius=redius
        registerName.layer.cornerRadius=redius
        self.registerEmail.delegate = self
        self.registerPW.delegate = self
        self.registerPW.isSecureTextEntry=true

    }
    override func viewDidLoad() {
        giveInfo.alpha = 0
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
