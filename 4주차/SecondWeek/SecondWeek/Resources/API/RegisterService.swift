//
//  RegisterService.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/05/16.
//  Copyright © 2020 김태훈. All rights reserved.
//

import Foundation
import Alamofire
struct RegisterService {
    static let registershared = RegisterService()
    private func registerParameter(_ id: String, _ pwd: String, _ name: String, _ email:String, _ phone:String) ->Parameters{
        return ["id":id, "password":pwd,"name": name, "email":email, "phone":phone]
    }
    func register(id:String,pwd:String,name:String,email:String,phone:String,completion:@escaping (RegisterResult<Any>) ->Void){
        let header : HTTPHeaders = ["Content-Type":"application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: registerParameter(id, pwd, name,email,phone), encoding: JSONEncoding.default, headers: header)
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode:Int, _ data : Data) -> RegisterResult<Any>{
        switch statusCode{
        case 200: return isUser(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isUser(by data: Data) -> RegisterResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SignupData.self, from: data) else {return .pathErr}
        if(decodeData.status == 204){return .success(decodeData.message)}
        return .exitingIDErr(decodeData.message)
    }
}
