//
//  SecondsToString.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2023-02-25.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import Foundation
import Firebase

class UserInfo {
    
    let db = Firestore.firestore()
    let userEmail = String(Auth.auth().currentUser!.email ?? "no email")
    var height = 0.0
    var weight = 0.0
    var goal = 0
    var sex = false
    var activity = 0
    var experience = 0
    var workoutDays = 0
    var age = 0
    
    static let instance = UserInfo()
    
    private init() {
    }
    
    func updateUserInfo(data: [String]){
        height = Double(data[0])!
        weight = Double(data[1])!
        goal = Int(data[2])!
        age = Int(data[3])!
        activity = Int(data[4])!
        
        if(Int(data[5]) == 1){
            sex = true
        }
    }
    
    func updateTrainingInfo(data: [String]){
        experience = Int(data[0])!
        workoutDays = Int(data[1])!
    }
    
    func writeToCloud(){
        db.collection("UserData").addDocument(data: [
            "height": height,
            "weight": weight,
            "goal": goal,
            "sex": sex,
            "activity": activity,
            "experience": experience,
            "age": age,
            "UID": String(Auth.auth().currentUser!.uid),
            "email": String(Auth.auth().currentUser!.email ?? "no email"),
            "date": Date().timeIntervalSince1970
        ])
        
        print("printed to cloud")
        
        db.collection("Current Exercise").addDocument(data: [
            "current workout": "Please Generate A Workout First",
            "number of exercises": 0
        ])
            {(error) in
                if let e = error {
                    print(e)
                } else {
                    print("Successfully saved data")
                }
            }
    }
    func generateTrainingPlan(){
        
        print("Model -> UserInfo -> func generateTrainingPlan")
        
        //Writes Exercise to Firebase
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
                        DispatchQueue.main.async { [self] in
                            let setWeight = (data["weight"] as? Double)!
                            let setMale = (data["sex"] as? Bool)!
                            let setExperience = (data["experience"] as? Int)!
    
                            let workoutGenerator = ExerciseGenerator(weight: setWeight, male: setMale, experience: setExperience, activeDays: workoutDays)
    
                            for i in 1...workoutDays {
                                print(i)
    
                                workoutGenerator.generate(workoutNumber: String(i))
                            }
                        }
                    }
                }
            }
        }
}
