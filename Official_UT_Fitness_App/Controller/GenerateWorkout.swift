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
    @IBOutlet weak var daysExercise: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }    

    @IBAction func generateButton(_ sender: UIButton) {
        
        let numberOfPlans = daysExercise.text!
        
        let userEmail = String(Auth.auth().currentUser!.email ?? "no email")
        db.collection("UserData")
            .whereField("email", isEqualTo: userEmail)
            .order(by: "date", descending: true)
            .limit(to: 1)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for doc in querySnapshot!.documents {
                        let data = doc.data()
                        DispatchQueue.main.async {
                            let setWeight = (data["weight"] as? Double)!
                            let setMale = (data["sex"] as? Bool)!
                            let setExperience = (data["experience"] as? Int)!
                            
                            let workoutGenerator = ExerciseGenerator(weight: setWeight, male: setMale, experience: setExperience, activeDays: Int(numberOfPlans)!)
                        
                            for i in 1...Int(numberOfPlans)! {
                                print(i)
                                
                                workoutGenerator.generate(workoutNumber: String(i))
                            }
                        }
                    }
                }
        }
    }
    
     @IBAction func HomeButton(_ sender: UIButton) {
         self.performSegue(withIdentifier: "returnHome", sender: self)
     }
}
