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
    
    @IBOutlet weak var userProfile: UIButton!
    @IBOutlet weak var editUserData: UIButton!
    @IBOutlet weak var userProgress: UIButton!
    @IBOutlet weak var generateNewWorkout: UIButton!
    @IBOutlet weak var startWorkout: UIButton!
    
    //let sessionStarter = Ses
    override func viewDidLoad() {
        //Login and Register
        //save user defaults to skip
        super.viewDidLoad()
        
        //Do any additional setup after loading the view.
        
        //Initializes "START WORKOUT" button
        let userIcon = UIImage(named: "user_icon.png")
        userProfile.clipsToBounds = true
        userProfile.imageView?.contentMode = .scaleAspectFit
        userProfile.setTitle("", for: .normal)
        userProfile.setImage(userIcon?.withRenderingMode(.alwaysOriginal), for: .normal)

        //Initializes "EDIT USER DATA" button
        let settingsImage = UIImage(named: "settings_icon.png")
        editUserData.clipsToBounds = true
        editUserData.imageView?.contentMode = .scaleAspectFit
        editUserData.setTitle("", for: .normal)
        editUserData.setImage(settingsImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //Initializes "USER PROGRESS" button
        let chartIcon = UIImage(named: "chart_icon.png")
        userProgress.clipsToBounds = true
        userProgress.imageView?.contentMode = .scaleAspectFit
        userProgress.setTitle("", for: .normal)
        userProgress.setImage(chartIcon?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //Initializes "GENERATE NEW WORKOUT" button
        let dumbbellImage = UIImage(named: "dumbbell_icon.png")
        generateNewWorkout.clipsToBounds = true
        generateNewWorkout.imageView?.contentMode = .scaleAspectFit
        generateNewWorkout.setTitle("", for: .normal)
        generateNewWorkout.setImage(dumbbellImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        //Initializes "START WORKOUT" button
        let startImage = UIImage(named: "start_workout_button.png")
        startWorkout.clipsToBounds = true
        startWorkout.imageView?.contentMode = .scaleAspectFit
        startWorkout.setTitle("", for: .normal)
        startWorkout.setImage(startImage?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        self.performSegue(withIdentifier: "goToNutrition", sender: self)
    }
    
    @IBAction func goToNutrition(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToNutrition", sender: self)
    }
    
    //Starts Workout
    @IBAction func startWorkout(_ sender: UIButton) {
        
        //initalizes workout sequence
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
