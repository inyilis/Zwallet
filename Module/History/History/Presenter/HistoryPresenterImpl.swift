//
//  HistoryPresenterImpl.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit
import Core

class HistoryPresenterImpl: HistoryPresenter {
    
    let view: HistoryView
    let interactor: HistoryInteractor
    let router: HistoryRouter
    
    init(view: HistoryView, interactor: HistoryInteractor, router: HistoryRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadWeeekTransaction() {
        self.interactor.getWeekTransaction()
    }
    
    func loadMonthTransaction() {
        self.interactor.getMonthTransaction()
    }
    
    func beckToHome() {
        self.router.navigateToHome()
    }
    
}

extension HistoryPresenterImpl: HistoryInteractorOutput {
    func loadedWeekTransaction(transactions: [TransactionEntity]) {
        self.view.showWeekTransactionData(transactions: transactions)
    }
    
    func loadedMonthTransaction(transactions: [TransactionEntity]) {
        self.view.showMonthTransactionData(transactions: transactions)
    }
    
}
