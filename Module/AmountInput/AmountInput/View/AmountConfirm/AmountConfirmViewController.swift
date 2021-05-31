//
//  AmountConfirmViewController.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import UIKit
import Core
import Kingfisher

class AmountConfirmViewController: UIViewController {

    @IBOutlet weak var receiverView: UIView!
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var noteView: UIView!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhoneNumber: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var presenter: AmountConfirmPresenter?
    var contactProfile: ContactsEntity?
    var amount: String?
    var date: String?
    var notes: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        receiverView.dropShadowEffect()
        amountView.dropShadowEffect()
        balanceView.dropShadowEffect()
        dateView.dropShadowEffect()
        noteView.dropShadowEffect()
        
        self.presenter?.loadDetails()
        self.showContactProfile()
    }
    
    func showContactProfile() {
        self.userName.text = self.contactProfile!.name
        self.userPhoneNumber.text = contactProfile!.phone

        let url = URL(string: contactProfile!.imageUrl)
        self.userImage.kf.setImage(with: url)
    }
    
    @IBAction func beckToAmountInputAction(_ sender: Any) {
        self.presenter?.backToAmountInput(viewController: self, contact: self.contactProfile!)
    }
    
    @IBAction func continueToConfirmPinAction(_ sender: Any) {
        self.presenter?.toConfirmPin(
            viewController: self,
            contact: self.contactProfile!,
            amount: self.amount!,
            balance: "\(self.balanceLabel.text!)",
            date: self.date!,
            notes: self.notes!)
    }
}

extension AmountConfirmViewController: AmountConfirmView {
    
    func showDetailsData(userBalance: Int) {
        let balance = (userBalance - self.amount!.formatToInt())
        self.amountLabel.text = amount!.formatToInt().formatToIdr()
        self.balanceLabel.text = balance.formatToIdr()
        self.dateLabel.text = date
        self.notesLabel.text = notes
        
//        if balance < 0 {
//        let alert = UIAlertController(title: "Warning", message: "Your balance is not sufficient, please Top Up first.", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//        } else {
//
//        }
    }
    
}
