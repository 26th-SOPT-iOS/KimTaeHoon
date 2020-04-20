//
//  MainViewController.swift
//  fisrtWeek
//
//  Created by 김태훈 on 2020/04/20.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class MainViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var getID: UITextField!
    @IBOutlet weak var getPW: UITextField!
    
    @IBAction func loginButtonClik(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController", creator: nil) as? LoginViewController else {return}
        receiveViewController.id=getID.text
        receiveViewController.pw=getPW.text
        self.present(receiveViewController,animated: true, completion: nil)
    }
    @IBAction func signInButtonClick(_ sender: Any) {
        guard let pushToNext = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") else {
            return}
        self.navigationController?.pushViewController(pushToNext, animated: true)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.getID.delegate = self
        self.getPW.delegate = self
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
