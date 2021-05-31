//
//  ConfirmViewController.swift
//  PinConfirm
//
//  Created by MacBook on 30/05/21.
//

import UIKit
import OTPFieldView

class ConfirmViewController: UIViewController {

    @IBOutlet weak var inputPin: OTPFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputPinView()
    }

    func setupInputPinView(){
        self.inputPin.fieldsCount = 6
        self.inputPin.fieldBorderWidth = 1
        self.inputPin.defaultBorderColor = UIColor.black
        self.inputPin.filledBorderColor = UIColor.green
        self.inputPin.cursorColor = UIColor.red
        self.inputPin.displayType = .square
        self.inputPin.fieldSize = 40
        self.inputPin.separatorSpace = 10
        self.inputPin.shouldAllowIntermediateEditing = false
        self.inputPin.delegate = self
        self.inputPin.initializeUI()
    }

    @IBAction func backToConfirmationAction(_ sender: Any) {
    }
    
    @IBAction func transferNowAction(_ sender: Any) {
    }
    
}

extension ConfirmViewController: OTPFieldViewDelegate {
    
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
    
}
