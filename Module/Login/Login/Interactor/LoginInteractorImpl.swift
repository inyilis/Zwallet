//
//  LoginInteractorImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Core

class LoginInteractorImpl: LoginInteractor {
    
    var interactorOutput: LoginInteractorOuput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postLoginData(email: String, password: String) {
        self.authNetworkManager.login(email: email, password: password) { data, error in
            if let loginData = data {
                UserDefaultHelper.shared.set(key: .email, value: loginData.email)
                UserDefaultHelper.shared.set(key: .userToken, value: loginData.token)
                UserDefaultHelper.shared.set(key: .refreshToken, value: loginData.refreshToken)
                
                // menyimpan tanggal dan waktu kapan token expired
                let tokenExpiredDate: Date = Calendar.current.date(byAdding: .second, value: loginData.expired_in / 1000, to: Date()) ?? Date()
                UserDefaultHelper.shared.set(key: .userTokenExpired, value: tokenExpiredDate)
                
                self.interactorOutput?.authenticationResult(isSuccess: true, hasPin: data!.hasPin)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: false, hasPin: false)
            }
        }
    }
}
