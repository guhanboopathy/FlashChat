//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Guhan
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "1@2.com"
        passwordTextField.text = "123456"
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            showAlertMessage(title: "", message: K.AlertMessage.emailMessage)
        } else {
            if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let err = error {
                        self.showAlertMessage(title: K.AlertMessage.error, message: err.localizedDescription)
                    }else {
                        self.performSegue(withIdentifier: K.loginSegue, sender: self)
                    }
                }
            }
        }
    }
    func showAlertMessage(title: String?, message: String) {
        let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19), NSAttributedString.Key.foregroundColor: UIColor(named: K.BrandColors.blue)]
        let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor(named: K.BrandColors.blue)]
        let titleStr = NSMutableAttributedString(string: title! , attributes: titleFont as [NSAttributedString.Key: Any])
        let messageString = NSMutableAttributedString(string: message, attributes: messageFont as [NSAttributedString.Key : Any])
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertView.setValue(messageString, forKey: K.AlertMessage.attMessage)
        alertView.setValue(titleStr, forKey: K.AlertMessage.attTitle)
        alertView.addAction(UIAlertAction(title: K.AlertMessage.OKTitle, style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
        
        
    }
    
}
