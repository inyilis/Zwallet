//
//  ReceiverApi.swift
//  Core
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Moya

public enum ReceiverApi {
    case searchContactByName(name: String)
    case getAllContacts
}

extension ReceiverApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .searchContactByName:
            return "/tranfer/search"
        case .getAllContacts:
            return "/tranfer/contactUser"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .searchContactByName(name: let name):
            return .requestParameters(parameters: ["name": name], encoding: URLEncoding.queryString)
        case .getAllContacts:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Containt-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
    }
    
    
}
