//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    let firebaseAuth = Auth.auth()

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        
        

        
        //TODO: Set up a new user on our Firbase database
        
        firebaseAuth.createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if (error != nil) {
                print(error!)
            } else {
                print("Registration successful")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }

        
        
        
        
    } 
    
    
}
