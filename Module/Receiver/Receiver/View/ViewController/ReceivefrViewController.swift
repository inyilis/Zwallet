//
//  ReceivefrViewController.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import UIKit
import Core

class ReceivefrViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchContacts: UISearchBar!
    @IBOutlet weak var contactFound: UILabel!
    
    var dataSource = ReceiverDataSource()
    var presenter: ReceiverPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.presenter?.loadGetAllContacts()
        self.searchContacts.delegate = self
    }
    
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "ContactsCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "ContactsCell")
        
        self.tableView.dataSource = self.dataSource
    }

    @IBAction func backToHome(_ sender: Any) {
        self.presenter?.backToHome()
    }
    
}

extension ReceivefrViewController: ReceiverView {
    
    func showGetAllContactData(contacts: [ContactsEntity]) {
        self.dataSource.getAllContacts = contacts
        self.dataSource.searchContactByName = contacts
        self.contactFound.text = "\(contacts.count) Contact Founds"
        self.tableView.reloadData()
    }
    
}

extension ReceivefrViewController: ContactsCellDelegate {
    
    func inputAmountForTransfer(contact: ContactsEntity) {
        self.presenter?.navigateToAmountInput(viewController: self, contacts: contact)
    }
    
}

extension ReceivefrViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.searchContactByName = dataSource.getAllContacts
        
        if searchText.isEmpty == false {
            dataSource.searchContactByName = dataSource.getAllContacts.filter({$0.name.contains(searchText)})
            self.contactFound.text = "\(self.dataSource.searchContactByName.count) Contact found"
        } else {
            self.contactFound.text = "\(self.dataSource.searchContactByName.count) Contact found"
        }
        tableView.reloadData()
    }
    
}
