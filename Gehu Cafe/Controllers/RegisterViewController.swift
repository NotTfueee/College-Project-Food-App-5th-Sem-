//
//  RegisterViewController.swift
//
//
//  Created by Anurag on 24/12/2022.
//
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        if let email = emailTextfield.text , let password = passwordTextfield.text
        {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error
                {
                    print(e.localizedDescription)
                }
                else
                {
                    //NAVIGATE TO THE CHAT SCREEN
                    
                    self.performSegue(withIdentifier: "RegisterToShop" , sender: self)
                }
            }
        }
    }
    
}
