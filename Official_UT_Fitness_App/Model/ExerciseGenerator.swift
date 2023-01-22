//
//  GenerateExercise.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-01-20.
//

import Foundation
import Firebase

struct ExerciseGenerator{
    let db = Firestore.firestore()
    var weight: Double       //weight in kilograms
    var male: Bool
    var experience: Int
    
    init(weight: Double, male: Bool, experience: Int){
        self.weight = weight
        self.male = male
        self.experience = experience
    }
        
    func arrayCreator(workoutNumber: Int)->[[String]]{
        var collection = [[String]]()
        var upperbound: Int
        
        if(self.experience > 2){
            upperbound = 6
        } else {
            upperbound = 5
        }
        
        for _ in 1...(upperbound-1){
            let newExercise = ["Exercise Name","Order","Time per set","Rest time","Weight"]
            collection.append(newExercise)
        }
        
        for _ in upperbound...10{
            let emptyExercise = ["N/A","N/A","N/A","N/A","N/A"]
            collection.append(emptyExercise)
        }
        
        return collection
    }
        
    func generate(day: String){
            let documentName = "Workout_" + day
            let whichWorkout = Int(day)!
            let exerciseCollection = self.arrayCreator(workoutNumber: whichWorkout)
            
            db.collection(documentName).addDocument(data: [
                "Exercise 0": exerciseCollection[0],
                "Exercise 1": exerciseCollection[1],
                "Exercise 2": exerciseCollection[2],
                "Exercise 3": exerciseCollection[3],
                "Exercise 4": exerciseCollection[4],
                "Exercise 5": exerciseCollection[5],
                "Exercise 6": exerciseCollection[6],
                "Exercise 7": exerciseCollection[7],
                "Exercise 8": exerciseCollection[8],
                "Exercise 9": exerciseCollection[9]
            ]){(error) in
                if let e = error {
                    print(e)
                } else {
                    print("Successfully generated workout plan")
                }
            }
        }
}
