//
//  WorkoutSession.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-02-13.
//

import Foundation
import Firebase

struct Session{
    
    let db = Firestore.firestore()
    let userEmail = String(Auth.auth().currentUser!.email ?? "no email")
    
    func setSession(exercisePlan: [Exercise]){
        let index = exercisePlan.count
        var SessionArray = [Int]()
        let defaults = UserDefaults.standard
        for i in 0..<index {
            SessionArray.append(Int(exercisePlan[i].info[5])!)
        }
        defaults.set(SessionArray, forKey: "Current Session")
    }
    
    func loadWorkoutSession(){
        db.collection("Current Workout")
            .whereField("email", isEqualTo: userEmail)
            .order(by: "date", descending: true)
            .limit(to: 1)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for doc in querySnapshot!.documents {
                        let data = doc.data()

                        let stringName = data["workout type"] as! String
                        let stringNumber = String(data["workout number"] as! Int)
                        let inputString = stringName + "_Workout_" + stringNumber
                        
                        self.setActiveExercise(readFrom: inputString)
                    }
                }
            }
        }
    
    func setActiveExercise(readFrom: String){
        
        //let setArray = [Int]()
        
        db.collection(readFrom)
            .whereField("email", isEqualTo: userEmail)
            .order(by: "date", descending: true)
            .limit(to: 1)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for doc in querySnapshot!.documents {
                        
                        let data = doc.data()
                        var i = 0
                        var index = "Exercise " + String(i)
                        
                        print(data[index] as! [String])
                    
                    }
                }
            }
    }
    
}
