//
//  UserManager.swift
//  testMIR
//
//  Created by Артём Балашов on 09/02/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper
import RxSwift

enum AuthMoyaService {
    case getToken(userName: String, password: String)
}

extension AuthMoyaService: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getToken:
            return .requestParameters(parameters: self.parameters ?? [:] , encoding: self.parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        return defaultHeaders
    }
    
    var baseURL: URL {
        return URL(string: "https://medicapp.mhth.ru/oauth/")!
    }
    var path: String {
        switch self {
        case .getToken:
            return "token"
        }
        
    }
    var method: Moya.Method {
        return .post
    }
    var parameters: [String: Any]? {
        switch self {
        case .getToken(let userName, let password):
            return ["grant_type": "password",
                    "username": userName,
                    "password": password
            ]
        }
    }
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
}

let AuthProvider = MoyaProvider<AuthMoyaService>()

class AuthService {
    static func auth(userName: String, password: String) -> Single<AuthResponse> {
        return AuthProvider.rx.request(.getToken(userName: userName, password: password)).filterSuccessfulStatusAndRedirectCodes().mapObject(AuthResponse.self)
    }
}
