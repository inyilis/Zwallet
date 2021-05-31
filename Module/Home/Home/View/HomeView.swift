//
//  HomeView.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import Core

protocol HomeView {
    func showUserProfileData(userProfile: UserProfileEntity)
    func showTransactionData(transactions: [TransactionEntity])
}
