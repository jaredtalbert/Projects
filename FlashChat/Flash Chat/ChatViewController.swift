//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Declare instance variables here
    
    let firebaseAuth = Auth.auth()
    
    var messageArray: [Message] = [Message]() // create an array of messages to populate the tableView

    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        
        
        
        //TODO: Set yourself as the delegate of the text field here:
        messageTextfield.delegate = self

        
        
        //TODO: Set the tapGesture here:
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        
        

        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell") // have to register so the code knows what the hell the design file looks like
        
        configureTableView()
        retrieveMessages()
        
        messageTableView.separatorStyle = .none
        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = messageArray[indexPath.row].message
        cell.senderUsername.text = messageArray[indexPath.row].sender
        
        cell.avatarImageView.image = UIImage(named: "egg")
        
        if (cell.senderUsername.text == firebaseAuth.currentUser?.email) {
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
        } else {
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
        }
        
        return cell
    }
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageArray.count
    }
    
    
    
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped() {
        messageTextfield.endEditing(true)
    }
    
    
    
    //TODO: Declare configureTableView here:
    func configureTableView() {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 308 // keyboard height + heigh constraint
            //TODO: Update depending on screen
            self.view.layoutIfNeeded() // update the view if any contraints have changed.
        }
        
    }
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    func textFieldDidEndEditing(_ textField: UITextField) {
        // return the text field to the bottom of the screen when the user stops typing (textfield loses focus)
        
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        messageTextfield.endEditing(true)
        
        
        //TODO: Send the message to Firebase and save it in our database
        
        // Debounce to prevent messing up sending of messages
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        let messageDatabase = Database.database().reference().child("Messages") // create/reference "Messages" DB
        
        let messageDict = ["Sender": firebaseAuth.currentUser?.email, "MessageBody": messageTextfield.text]
        
        messageDatabase.childByAutoId().setValue(messageDict) {
            (error, reference) in
            if (error != nil) {
                print("FIREBASE ERROR - \(error!)")
            } else {
                print("Message saved successfully")
                
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
            }
        }
        
        
        
    }
    
    //TODO: Create the retrieveMessages method here:
    func retrieveMessages() {
        let messageDatabase = Database.database().reference().child("Messages")
        
        messageDatabase.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, String>
            
            let messageText = snapshotValue["MessageBody"]!
            let messageSender = snapshotValue["Sender"]!
            
            let message = Message()
            message.message = messageText
            message.sender = messageSender
            
            self.messageArray.append(message)
            
            self.configureTableView() // redraw the table
            self.messageTableView.reloadData() // gather the new data
            
        }
    }
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("ERROR - Unable to sign out")
        }
        
    }
    


}
