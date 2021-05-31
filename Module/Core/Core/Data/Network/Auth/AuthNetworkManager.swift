//
//  AuthNetworkManager.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public protocol AuthNetworkManager {
    func login(email: String, password: String, completion: @escaping (LoginDataResponse?, Error?) -> ())
    func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenDataResponse?, Error?) -> ())
    func signUp(username: String, email: String, password: String, completion: @escaping (CommonResponse?, Error?) -> ())
    func confirmOtp(email: String, otp: String, completion: @escaping (CommonResponse?, Error?) -> ())
    func setPin(pin: String, completion: @escaping (CommonResponse?, Error?) -> ())
}
