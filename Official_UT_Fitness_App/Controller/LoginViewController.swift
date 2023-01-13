//
//  LoginViewController.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-01-12.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

  
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func LoginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                
                if let e = error{
                    print(e)
                } else {
                    self.performSegue(withIdentifier: "LoginToMainscreen", sender: self)
                }
            }
            
        }
    }

    @IBAction func RegisterPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoToRegister", sender: self)
    }
}
