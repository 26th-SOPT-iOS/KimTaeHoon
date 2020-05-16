//
//  NetworkResult.swift
//  SecondWeek
//
//  Created by 김태훈 on 2020/05/16.
//  Copyright © 2020 김태훈. All rights reserved.
//

import Foundation

enum NetworkResult<T>{
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
