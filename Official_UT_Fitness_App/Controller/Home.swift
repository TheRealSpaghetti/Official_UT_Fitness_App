//
//  NutritionStats.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    let SessionCreator = Session()
    var testArray = [2]
    
    //let sessionStarter = Ses
    override func viewDidLoad() {
        //Login and Register
        //save user defaults to skip
        
        super.viewDidLoad()
        //Do any additional setup after loading the view.
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("swipe detected")
        self.performSegue(withIdentifier: "goToNutrition", sender: self)
    }
    
    //Starts Workout
    @IBAction func startWorkout(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        //SessionCreator.loadWorkoutSession()
        print("button pressed")
        
    
        if(testArray.isEmpty){
            print("case 1\n")
            print("array is empty")
        } else if(testArray[0] != 0){
            print("case 2\n")
            testArray[0] -= 1
            print(testArray)
        } else if(testArray[0] == 0){
            //code to finish workout because necessary condition was met
            print("case 3\n")
            testArray.removeFirst()
            print(testArray)
        }
        

        
        //call method to add [Exercise], to add it to User Defaults
        //defaults.set("Workout in Progress", forKey: "App Status")
        //self.performSegue(withIdentifier: "startWorkout", sender: self)
    }
    
    
    
    
    

    
    
    @IBAction func goToUserData(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HomeToInfo", sender: self)
    }
    
    @IBAction func goToGeneratePage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGeneratePage", sender: self)
    }
}
