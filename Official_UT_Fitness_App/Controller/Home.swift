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
        let totalExerciseNumber = defaults.object(forKey:"Total_Exercises") as? Int ?? 0
        let setsLeft = defaults.object(forKey:"Exercises_Left") as? [Int] ?? [Int]()
        
        SessionCreator.loadWorkoutSession()
        SessionCreator.updateSessionUI(indexToReadFrom: (totalExerciseNumber - setsLeft.count))
        self.performSegue(withIdentifier: "startWorkout", sender: self)
    }
    
    
    @IBAction func goToUserData(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HomeToInfo", sender: self)
    }
    
    @IBAction func goToGeneratePage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGeneratePage", sender: self)
    }
}
