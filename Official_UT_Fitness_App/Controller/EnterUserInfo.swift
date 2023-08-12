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
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var goalSelector: UISegmentedControl!
    @IBOutlet weak var sexSelector: UISegmentedControl!
    
    //Initalize variables with default values
    var activityNum: String = "2"
    var dietGoal: String = "1"
    var userSex: String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goalSelectAction(_ sender: Any) {
        if goalSelector.selectedSegmentIndex == 0 {
            dietGoal = "0"
        } else if (goalSelector.selectedSegmentIndex == 1){
            dietGoal = "1"
        } else {
            dietGoal = "2"
        }
    }
    
    @IBAction func sexSelectAction(_ sender: Any) {
        if sexSelector.selectedSegmentIndex == 0 {
            userSex = "1"
        } else {
            userSex = "0"
            }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        activityNum = String(Int(sender.value))
    }
        
    @IBAction func setUserData(_ sender: UIButton) {
        let userHeight = heightInput.text
        let userWeight = weightInput.text
        let userGoal = dietGoal
        let userSex = userSex
        let userActivity = activityNum
        let userAge = ageInput.text
            
        var dataArray = [String]()
        dataArray.append(userHeight ?? "175")
        dataArray.append(userWeight ?? "60")
        dataArray.append(userGoal)
        dataArray.append(userAge ?? "1")
        dataArray.append(userActivity)
        dataArray.append(userSex)
        
        UserInfo.instance.updateUserInfo(data: dataArray)
        UserInfo.instance.writeToCloud()
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goBackHome", sender: self)
    }
}
