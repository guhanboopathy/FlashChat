//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Guhan

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var flashTitleLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let title = K.appName
        flashTitleLabel.text = title
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
