//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD


class LogInViewController: UIViewController {
    
    let firebaseAuth = Auth.auth()

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        // first, check to make sure that the user formatted everything correctly
        if (emailTextfield.text?.contains("@")) && (pass)! {
            
        }
        
        SVProgressHUD.show()
        
        

        
        //TODO: Log in the user
        firebaseAuth.signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if (error != nil) {
                print("FIREBASE ERROR: \(error!)")
            } else {
                print("Login was successful!")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
        
    }
    


    
}  
