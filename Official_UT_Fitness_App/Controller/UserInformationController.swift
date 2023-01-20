//
//  UserInformationController.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-01-14.
//

import UIKit
import Firebase

class UserInformationController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var goalInput: UITextField!
    @IBOutlet weak var sexInput: UITextField!
    @IBOutlet weak var activityInput: UITextField!
    @IBOutlet weak var experienceInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setUserData(_ sender: UIButton) {
        
        if let userHeight = heightInput.text, let userWeight = weightInput.text, let userGoal = goalInput.text, let userSex = sexInput.text, let userActivity = activityInput.text, let userExperience = experienceInput.text, let userAge = ageInput.text{
            
            db.collection("UserData").addDocument(data: [
                "height": Double(userHeight),
                "weight": Double(userWeight),
                "goal": Int(userGoal),
                "sex": true,
                "activity": Int(userActivity),
                "experience": Int(userExperience),
                "age": Int(userAge),
                "UID": String(Auth.auth().currentUser!.uid),
                "email": String(Auth.auth().currentUser!.email ?? "no email"),
                "date": Date().timeIntervalSince1970
            ]){(error) in
                if let e = error {
                    print(e)
                } else {
                    print("Successfully saved data")
                }
            }
        }
        
        
    }
}
