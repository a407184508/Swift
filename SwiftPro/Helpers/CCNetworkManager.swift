//
//  CCNetworkManager.swift
//  SwiftPro
//
//  Created by Chuck on 2021/4/6.
//

import Foundation
import Moya



enum CCService {
    case login(phone: String, code: String)
}

extension CCService: TargetType {
    var baseURL: URL {
        URL(string: "")!
    }
    
    var path: String {
        ""
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        "".data(using: .utf8)!
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        nil
    }
}
