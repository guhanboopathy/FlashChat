# FlashChat
 Developer : Guhan Boopathy
 Email id: guhanboopathi30@gmail.com
 
 Tools: Xcode, Github, Simulator.
 Language: Swift.
 Description: Chat Application using Google FireBase.
 Model: MVC.
 
 Developed a iOS Chat Application using Google Firebase. Its an chat online application. Welcome scrren consist of two buttons. One used to login and another for Register.In register screen after user enter username and password it check for nil value and shown an alert if any one field is empty and if both were not empty it request API call from Google firebase and fetch response data. If data is error of shows alert message to user. Upon success data it took to messages screen. Above method of authentication and API calls are used for Login method also.Three Framworks used in this application. CLTyping Label and Firebase were intergrated using Cocoapods and IQKeyboardManager integrated using Swift package Dependencies.
 
 Framework Used:
 1. CLTyping Label
                It used for text apperence one after another(Used for Title Animation in welcome screen).
2. FireBase
                Google FireBase used to user Authentication and message storage and retrivel.
3. IQKeyboardManager
                Used for automatic height of chat screen view when user typing message.
