//
//  SignUpViewController.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var presenter: SignUpPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let username: String = usernameField.text ?? ""
        let email: String = emailField.text ?? ""
        let password: String = passwordField.text ?? ""
        
        self.presenter?.signUp(username: username, email: email, password: password)
    }
    
    @IBAction func toLoginAction(_ sender: Any) {
        self.presenter?.toLogin()
    }
}

extension SignUpViewController: SignUpView {
    
    func confirmOtp() {
        self.presenter?.toConfirmOtp(viewController: self, email: emailField.text!)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Warning", message: "Username or Email already registered.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
