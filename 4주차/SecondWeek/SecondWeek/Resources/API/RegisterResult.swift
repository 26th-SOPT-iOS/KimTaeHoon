//
//  RegisterResult.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/05/16.
//  Copyright © 2020 김태훈. All rights reserved.
//

import Foundation
enum RegisterResult<T>{
    case success(T)
    case exitingIDErr(T)
    case pathErr
    case serverErr
    case networkFail
}
