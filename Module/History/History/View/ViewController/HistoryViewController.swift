//
//  HistoryViewController.swift
//  History
//
//  Created by MacBook on 25/05/21.
//

import UIKit
import Core

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var outFilter: UIButton!
    @IBOutlet weak var inFilter: UIButton!
    @IBOutlet weak var filterByDate: UIButton!
    
    var dataSource = HistoryDataSource()
    
    var presenter: HistoryPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outFilter.dropShadowEffect()
        inFilter.dropShadowEffect()
        filterByDate.dropShadowEffect()

        self.setupTableView()
        
        self.presenter?.loadWeeekTransaction()
        self.presenter?.loadMonthTransaction()
    }
    
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "WeekTableViewCell", bundle: Bundle(identifier: "com.casestudy.History")), forCellReuseIdentifier: "WeekTableViewCell")
        self.tableView.register(UINib(nibName: "MonthTableViewCell", bundle: Bundle(identifier: "com.casestudy.History")), forCellReuseIdentifier: "MonthTableViewCell")
        self.tableView.register(UINib(nibName: "FilterCell", bundle: Bundle(identifier: "com.casestudy.History")), forCellReuseIdentifier: "FilterCell")
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")
        
        self.tableView.dataSource = self.dataSource
    }
    
    @IBAction func backToHome(_ sender: Any) {
        self.presenter?.beckToHome()
    }
    
}

extension HistoryViewController: HistoryView {
    
    func showWeekTransactionData(transactions: [TransactionEntity]) {
        self.dataSource.weekTransaction = transactions
        self.tableView.reloadData()
    }
    
    func showMonthTransactionData(transactions: [TransactionEntity]) {
        self.dataSource.monthTransaction = transactions
        self.tableView.reloadData()
    }
    
}
