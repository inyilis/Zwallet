//
//  LoginViewController.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var viewLogin: UIView!
    
    var presenter: LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.viewLogin.dropShadowEffect()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        let email: String = emailField.text ?? ""
        let password: String = passwordField.text ?? ""
        
        self.presenter?.login(email: email, password: password)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        self.presenter?.toSignUp(viewController: self)
    }
}

extension LoginViewController: LoginView {
    
    func toSetPin() {
        self.presenter?.toSetPin(viewController: self)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Warning", message: "Your username or password is wrong, please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
