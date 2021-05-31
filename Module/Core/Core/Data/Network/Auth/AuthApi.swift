//
//  AuthApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum AuthApi {
    case login(email: String, password: String)
    case refreshToken(email: String, refreshToken: String)
    case signUp(username: String, email: String, password: String)
    case confirmOtp(email: String, otp: String)
    case setPin(pin: String)
}

extension AuthApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signUp:
            return "/auth/signup"
        case .confirmOtp(let email, let otp):
            return "/auth/activate/\(email)/\(otp)"
        case .setPin:
            return "/auth/PIN"
        case .refreshToken:
            return "/auth/refresh-token"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login, .signUp, .refreshToken:
            return .post
        case .confirmOtp:
            return .get
        case .setPin:
            return .patch
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login(email: let email, password: let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .signUp(username: let username, email: let email, password: let password):
            return .requestParameters(parameters: ["username": username, "email": email, "password": password], encoding: JSONEncoding.default)
        case .confirmOtp:
            return .requestPlain
        case .setPin(pin: let pin):
            return .requestParameters(parameters: ["PIN": pin], encoding: JSONEncoding.default)
        case .refreshToken(email: let email, refreshToken: let refreshToken):
            return .requestParameters(parameters: ["email": email, "refreshToken": refreshToken], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .setPin, .refreshToken:
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        default:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
    
}
