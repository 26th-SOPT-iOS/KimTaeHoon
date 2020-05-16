//
//  LoginService.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/05/16.
//  Copyright © 2020 김태훈. All rights reserved.
//

import Foundation
import Alamofire
struct LoginService{
    static let shared = LoginService()
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters{
        return ["id":id, "password":pwd]
    }
    func login(id:String, pwd:String, completion:@escaping (NetworkResult<Any>) -> Void){
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode:Int, _ data : Data) -> NetworkResult<Any>{
        switch statusCode{
        case 200: return isUser(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    private func isUser(by data: Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let decodeData = try? decoder.decode(SigninData.self, from: data) else {
            return .pathErr
        }
        guard let tokenData = decodeData.data else {
            return .requestErr(decodeData.message)
        }
        return .success(tokenData.jwt)
    }
}
