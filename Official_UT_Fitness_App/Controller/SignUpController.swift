//
//  SignUpController.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-01-12.
//

import UIKit
import Firebase

class SignUpController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func UserCreatePressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                
                if let e = error{
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "RegisterToHome", sender: self)
                }
            }
        }
    }
}
