//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Guhan
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            
            showAlertMessage(title: "", message: K.AlertMessage.emailMessage)
            
        }else {
            if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        self.showAlertMessage(title: K.AlertMessage.error, message: e.localizedDescription)
                    } else {
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            }
        }
    }
    
    func showAlertMessage(title: String?, message: String) {
        let messageFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor(named: K.BrandColors.blue)]
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
