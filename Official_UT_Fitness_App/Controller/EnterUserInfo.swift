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
    @IBOutlet weak var activityLevel: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setUserData(_ sender: UIButton) {
        if let userHeight = heightInput.text, let userWeight = weightInput.text, let userGoal = goalInput.text, let userSex = sexInput.text, let userActivity = activityLevel.text, let userAge = ageInput.text{
            
            var dataArray = [String]()
            dataArray.append(userHeight)
            dataArray.append(userWeight)
            dataArray.append(userGoal)
            dataArray.append(userAge)
            dataArray.append(userActivity)
            dataArray.append(userSex)
            
            UserInfo.instance.updateUserInfo(data: dataArray)
        }
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goBackHome", sender: self)
    }
}
