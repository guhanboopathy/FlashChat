//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Guhan
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    var messages: [Message] = []
    let db = Firestore.firestore()
    @IBOutlet weak var chatTableView: UITableView!
    
    @IBOutlet weak var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        messageTextField.text = nil
        chatTableView.dataSource = self
        navigationItem.hidesBackButton = true
        loadMessage()
        
    }
    
    func loadMessage() {
        
        db.collection(K.Fstore.collectionName).order(by: K.Fstore.dateField)
            .addSnapshotListener { querySnapShot, error in
                self.messages = []
                if let e = error {
                    print(e)
                }
                if let query = querySnapShot?.documents {
                    for each in query {
                        let data = each.data()
                        if let MessageSender = data[K.Fstore.senderField] as? String, let messageBody = data[K.Fstore.bodyField] as? String {
                            let newMessage = Message(sender: MessageSender, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.chatTableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                                self.chatTableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        if let message = messageTextField.text, let sender = Auth.auth().currentUser?.email {
            db.collection(K.Fstore.collectionName).addDocument(data: [
                                                                K.Fstore.senderField: sender,
                                                                K.Fstore.bodyField: message,
                                                                K.Fstore.dateField: Date().timeIntervalSince1970]) { error in
                if let e = error {
                    print(e)
                }else {
                    print("Successfully saved Data")
                    self.messageTextField.text = nil
                    DispatchQueue.main.async {
                        self.chatTableView.reloadData()
                        let indexpath = IndexPath(row: self.messages.count-1, section: 0)
                        self.chatTableView.scrollToRow(at: indexpath, at: .top, animated: false)
                    }
                }
            }
        }
    }
    
    
    @IBAction func logOutButttonTapped(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftHandImage.isHidden = true
            cell.rightHandImage.isHidden = false
            cell.messageBubbleView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.purple)
        }else {
            cell.leftHandImage.isHidden = false
            cell.rightHandImage.isHidden = true
            cell.messageBubbleView.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        return cell
    }
    
    
}
