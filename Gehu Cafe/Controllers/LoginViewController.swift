//
//  LoginViewController.swift
//  
//
//  Created by Anurag on 24/12/2022.
//
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
       if let email = emailTextfield.text , let password = passwordTextfield.text
        {
           
           Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
               
               if let e = error
               {
                   print(e.localizedDescription)
               }
               else
               {
                   self.performSegue(withIdentifier: "LoginToShop", sender: self)
               }
               
           }
       }
    }
    
}
