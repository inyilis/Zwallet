//
//  OtpViewController.swift
//  Otp
//
//  Created by MacBook on 26/05/21.
//

import UIKit

class OtpViewController: UIViewController {
    
    var email: String?

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    
    var presenter: OtpPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tf1.delegate = self
        self.tf2.delegate = self
        self.tf3.delegate = self
        self.tf4.delegate = self
        self.tf5.delegate = self
        self.tf6.delegate = self
        
        tf1.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        tf2.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        tf3.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        tf4.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        tf5.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        tf6.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tf1.becomeFirstResponder()
    }

    @IBAction func confirmAction(_ sender: Any) {
//        print("email: \(email!) => otp: \(tf1.text!)\(tf2.text!)\(tf3.text!)\(tf4.text!)\(tf5.text!)\(tf6.text!)")
        self.presenter?.confirmOtp(email: email!, otp: "\(tf1.text!)\(tf2.text!)\(tf3.text!)\(tf4.text!)\(tf5.text!)\(tf6.text!)")
    }
}

extension OtpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.utf16.count == 1 && !string.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text
        
        if text?.utf8.count == 1 {
            switch textField {
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf5.becomeFirstResponder()
            case tf5:
                tf6.becomeFirstResponder()
//            case tf6:
//                tf6.resignFirstResponder()
            default:
                break
            }
        } else if text!.isEmpty {
            switch textField {
            case tf2:
                tf1.becomeFirstResponder()
            case tf3:
                tf2.becomeFirstResponder()
            case tf4:
                tf3.becomeFirstResponder()
            case tf5:
                tf4.becomeFirstResponder()
            case tf6:
                tf5.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
}

extension OtpViewController: OtpView {
    
    func showSuccess() {
        let alert = UIAlertController(title: "Warning", message: "Congratulations, your account has been activated successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.presenter?.toLogin()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Warning", message: "The OTP code does not match or the email has not been registered or the account has been activated.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
