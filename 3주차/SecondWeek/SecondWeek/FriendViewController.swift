//
//  FriendViewController.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/05/12.
//  Copyright © 2020 김태훈. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    @IBOutlet weak var FriendTable: UITableView!
    @IBAction func settingButtonClicked(_ sender: Any) {
        let setting = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        setting.addAction(UIAlertAction(title: "친구 관리", style: .default , handler:{ (UIAlertAction)in
            print("친구 관리 클릭")
        }))

        setting.addAction(UIAlertAction(title: "전체 설정", style: .default , handler:{ (UIAlertAction)in
            print("전체 설정 클릭")
        }))
        setting.addAction(UIAlertAction(title: "취소", style:.cancel, handler: {(UIAlertAction)in print("취소")}))
        self.present(setting, animated: true, completion: {
            print("completion block")
        })
    }
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var myFriendNumber: UILabel!
    
    private var FriendInfo: [FriendList] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFriendInfo()
        FriendTable.delegate=self
        FriendTable.dataSource=self
        // Do any additional setup after loading the view.
    }
    private func setFriendInfo(){
        let friend1=FriendList(profilename: "profile1Img", name: "1번친구", message: "aaaaaa")
        let friend2=FriendList(profilename: "profile2Img", name: "2번친구", message: "sssss")
        let friend3=FriendList(profilename: "profile3Img", name: "3번친구", message: "dddddd")
        let friend4=FriendList(profilename: "profile4Img", name: "4번친구", message: "ffffff")
        let friend5=FriendList(profilename: "profile5Img", name: "5번친구", message: "qqqqqq")
        let friend6=FriendList(profilename: "profile6Img", name: "6번친구", message: "wwwww")
        let friend7=FriendList(profilename: "profile7Img", name: "7번친구", message: "eeeeee")
        let friend8=FriendList(profilename: "profile8Img", name: "8번친구", message: "rrrrrr")
        let friend9=FriendList(profilename: "profile9Img", name: "9번친구", message: "tttttt")
        let friend10=FriendList(profilename: "profile10Img", name: "10번친구", message: "yyyyyy")
        let friend11=FriendList(profilename: "profile11Img", name: "11번친구", message: "aaaaaaaaaa")
        FriendInfo = [friend1,friend2,friend3,friend4,friend5,friend6,friend7,friend8,friend9,friend10,friend11]
        myFriendNumber.text="친구 "+String(FriendInfo.count)
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
extension FriendViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: friendTableViewCell.identifier, for: indexPath) as? friendTableViewCell
            else{return UITableViewCell()}
        friendCell.setFriendInformation(profileImageName: FriendInfo[indexPath.row].profilename, name: FriendInfo[indexPath.row].name, message: FriendInfo[indexPath.row].message)
        return friendCell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            FriendInfo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            myFriendNumber.text="친구 "+String(FriendInfo.count)        }
        else if editingStyle == .insert{
        }
    }
    
}
extension FriendViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
