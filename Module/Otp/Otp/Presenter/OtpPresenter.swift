//
//  OtpPresenter.swift
//  Otp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

protocol OtpPresenter {
    func confirmOtp(email: String, otp: String)
    func toLogin()
}
