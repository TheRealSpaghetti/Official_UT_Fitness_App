//
//  GenerateWorkout.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-01-21.
//

import UIKit
import Firebase

class GenerateWorkout: UIViewController {

    @IBOutlet weak var daysExercise: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }    

    @IBAction func generateButton(_ sender: UIButton) {
        
        var numberOfPlans = daysExercise.text!
        var workoutGenerator = ExerciseGenerator()
        
        for i in 1...Int(numberOfPlans)! {
            workoutGenerator.generate(day: String(i))
        }
    }
    
     @IBAction func HomeButton(_ sender: UIButton) {
         self.performSegue(withIdentifier: "returnHome", sender: self)
     }
}
