//
//  HomePresenterImpl.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HomePresenterImpl: HomePresenter {
    
    let view: HomeView
    let interactor: HomeInteractor
    let router: HomeRouter
    
    init(view: HomeView, interactor: HomeInteractor, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadProfile() {
        self.interactor.getUserProfile()
    }
    
    func loadTransaction() {
        self.interactor.getTransaction()
    }
    
    func transfer(viewController: UIViewController) {
        self.router.navigateToTransfer(viewController: viewController)
    }
    
    func topUp(viewController: UIViewController) {
        self.router.navigateToTopUp(viewController: viewController)
    }
    
    func showHistory(viewController: UIViewController) {
        self.router.navigateToHistory(viewController: viewController)
    }
    
    func logout() {
        UserDefaultHelper.shared.remove(key: .userToken)
        self.router.navigateToLogin()
    }
}

extension HomePresenterImpl: HomeInteractorOuput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showUserProfileData(userProfile: userProfile)
    }
    
    func loadedTransaction(transactions: [TransactionEntity]) {
        self.view.showTransactionData(transactions: transactions)
    }
    
}
