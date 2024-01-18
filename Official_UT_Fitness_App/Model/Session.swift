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
        print("load method called")
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
                        print(inputString)
                        self.setActiveExercise(readFrom: inputString)
                        print("done")
                    }
                }
            }
    }
    
    func setActiveExercise(readFrom: String){
        var setArray = [Int]()
        var numberOfExcerises = 0
        print("setActiveExercises called")
        
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
                        while(i<9){
                            let index = "Exercise " + String(i)
                            let stringArray = data[index] as! [String]
                            
                            if(stringArray[4] != "N/A"){
                                setArray.append(Int(stringArray[4])!)
                                numberOfExcerises += 1
                            }
                            i += 1
                        }
                        print("METHOD CALLED: USER DEFAULTS UPDATED")
                        
                        let defaults = UserDefaults.standard
                        defaults.set(numberOfExcerises, forKey: "Total_Exercises")
                        defaults.set(setArray, forKey: "Exercises_Left")
                    }
                }
            }
    }
    
    func updateSessionUI(indexToReadFrom: Int){
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
                        self.updateSessionUIHelper(readFrom: inputString, index: indexToReadFrom)
                    }
                }
            }
    }
    
    func updateSessionUIHelper(readFrom: String, index: Int){
        
        var setArray = [String]()
        
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
                        let stringIndex = "Exercise " + String(index)
                        let stringArray = data[stringIndex] as! [String]
                            
                        if(stringArray[0] != "N/A"){
                            setArray.append(stringArray[0])         //Exercise name
                            setArray.append(stringArray[1])         //Exercise time
                            setArray.append(stringArray[2])         //Exercise rest time
                            setArray.append(stringArray[3])         //Exercise set number
                            setArray.append(stringArray[4])         //Exercise rep number
                        }
                        
                        let defaults = UserDefaults.standard
                        defaults.set(setArray, forKey: "Current_Exercise_Info")    //Saves data into a UserDefaults for                                                                    "TrainingSession" to use
                    }
                }
            }
    }
}
