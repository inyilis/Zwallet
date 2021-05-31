//
//  ConfirmPinViewController.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import UIKit
import Core
import OTPFieldView

class ConfirmPinViewController: UIViewController {

    @IBOutlet weak var inputPin: OTPFieldView!
    
    var presenter: ConfirmPinPresenter?
    var contactProfile: ContactsEntity?
    var amount: String?
    var balance: String?
    var date: String?
    var notes: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInputPinView()
    }
    
    func setupInputPinView(){
        self.inputPin.fieldsCount = 6
        self.inputPin.fieldBorderWidth = 1
        self.inputPin.defaultBorderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.inputPin.filledBorderColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
        self.inputPin.cursorColor = #colorLiteral(red: 0.3882352941, green: 0.4745098039, blue: 0.9568627451, alpha: 1)
        self.inputPin.displayType = .roundedCorner
        self.inputPin.fieldSize = 45
        self.inputPin.separatorSpace = 10
        self.inputPin.shouldAllowIntermediateEditing = false
        self.inputPin.delegate = self
        self.inputPin.secureEntry = true
        self.inputPin.initializeUI()
    }
    
    @IBAction func backToConfirmationAction(_ sender: Any) {
        self.presenter?.backToAmountConfirm(viewController: self, contact: contactProfile!, amount: amount!, date: date!, notes: notes!)
    }
    
    @IBAction func transferNowAction(_ sender: Any) {
        self.presenter?.transferTo(receiver: self.contactProfile!.id, amount: self.amount!.formatToInt(), notes: self.notes!)
    }
}

extension ConfirmPinViewController: OTPFieldViewDelegate {

    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }

    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }

    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
        UserDefaultHelper.shared.set(key: .confirmPin, value: otpString)
    }

}

extension ConfirmPinViewController: ConfirmPinView {
    
    func showSuccess() {
        self.presenter?.toDetails(viewController: self, contact: contactProfile!, amount: amount!, balance: balance!, date: date!, notes: notes!)
    }
    
    func showFailed() {
        let alert = UIAlertController(title: "Transfer Failed", message: "Wrong PIN, please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
