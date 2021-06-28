//
//  Constants.swift
//  FlashChat
//
//  Created by Guhan
//

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
    }
    
    struct Fstore {
        static let collectionName = "message"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct AlertMessage {
        static let error = "Error"
        static let emailMessage = "Please enter valid username and password"
        static let OKTitle = "OK"
        static let attMessage = "attributedMessage"
        static let attTitle = "attributedTitle"
    }
}
