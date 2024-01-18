//
//  GenerateWorkout.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-01-21.
//

import UIKit
import Firebase

class GenerateWorkout: UIViewController {

    let db = Firestore.firestore()
    var daysNumber: String?
    var expNumber: String?
    
    @IBOutlet weak var daySelector: UISegmentedControl!
    @IBOutlet weak var programSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func expSliderChanged(_ sender: UISlider) {
        expNumber = String(Int(sender.value))
    }
    
    @IBAction func daySelectorAction(_ sender: Any) {
        if daySelector.selectedSegmentIndex == 0 {
            daysNumber = "1"
        } else if (daySelector.selectedSegmentIndex == 1){
            daysNumber = "2"
        } else if (daySelector.selectedSegmentIndex == 2){
            daysNumber = "3"
        } else if (daySelector.selectedSegmentIndex == 3){
            daysNumber = "4"
        } else if (daySelector.selectedSegmentIndex == 4){
            daysNumber = "5"
        } else {
            daysNumber = "6"
        }
    }
    
    //TODO: IMPLEMENT THIS FUNCTION AT A LATER DATE, CREATE DATABASE FOR DIFFERENT TRAINING REGIMEN
    @IBAction func programSelectorAction(_ sender: Any) {
        if programSelector.selectedSegmentIndex == 0 {
            print("Strength Training")
        } else if (programSelector.selectedSegmentIndex == 1){
            print("Hypertrophy Training Selected")
        } else {
            print("Hybrid Training Selected")
        }
    }
    
    @IBAction func generateWorkoutButton(_ sender: UIButton) {
        print("days: \(daysNumber) and exp: \(expNumber)")
        
        if let days = daysNumber, let exp = expNumber{
            var dataArray = [String]()
            dataArray.append(exp)
            dataArray.append(days)
        
            UserInfo.instance.updateTrainingInfo(data: dataArray)
            UserInfo.instance.generateTrainingPlan()
        }
        print("function complete")
    }
    
     @IBAction func HomeButton(_ sender: UIButton) {
         self.performSegue(withIdentifier: "returnHome", sender: self)
     }
}
