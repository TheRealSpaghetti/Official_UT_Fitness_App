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
        
    func SBD_Generator(workoutNumber: Int)->[[String]]{
        var collection = [[String]]()
        var upperbound: Int
        let randomInt = Int.random(in: 1...3)
        var extraMuscleGroup: String
        
        if(randomInt == 1){
            extraMuscleGroup = "ChestSecondary"
        } else{
            extraMuscleGroup = "BackSecondary"
        }
        
        let exercisePlan = ["ChestPrimary","BackPrimary","LegsPrimary","Shoulders",extraMuscleGroup]
        
        //If the user is sufficiently experienced, give them an extra exercise in their routine
        if(self.experience > 2){
            upperbound = 5
        } else {
            upperbound = 4
        }
        
        //generates exercise
        for i in 1...(upperbound-1){
            let randomExerciseIndex = String(Int.random(in: 1...3))
            
            let exerciseToAdd = "Exercise" + "." + exercisePlan[i] + "." + "__" + randomExerciseIndex
            let exerciseName = "Exercise" + "." + exercisePlan[i] + "." + "__" + randomExerciseIndex + "." + "info[0]"
            
            print ("Test: \(String(exerciseName))")
            print(Exercise.BackPrimary.__3.info[0])
            
            //let exerciseSetTime = exercisePlan[i]
            //let exerciseRestTime = exercisePlan[i]
            //let exerciseWeight = exercisePlan[i]
            
            
            let newExercise = [exerciseName,"Time per set","Rest time","Reps","Sets","Weight"]
            collection.append(newExercise)
            
        }
        
        //fills in the empty slots
        for _ in upperbound...10{
            let emptyExercise = ["N/A","N/A","N/A","N/A","N/A","N/A"]
            collection.append(emptyExercise)
        }

        return collection
    }
    
    func generate(day: String){
        //if day == 1 || day ==  2 (create SBD workout plan)  <== CREATING THIS
        //if day == 6 || day ==  2 (create SBD workout plan)
    
        let documentName = "Workout_" + day
        let workoutType = Int(day)!
    
        let exerciseCollection: [[String]]
    
        if(workoutType <= 2){                   //CURRENTLY WORKING ON THIS
            exerciseCollection = self.SBD_Generator(workoutNumber: workoutType)
        } else if(workoutType <= 4){                                            //TO BE CHANGED TO TBA
            exerciseCollection = self.SBD_Generator(workoutNumber: workoutType)
        } else {                                                                 //TO BE CHANGED TO PPL
            exerciseCollection = self.SBD_Generator(workoutNumber: workoutType)
        }
    
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
