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
    let exerciseLib = ExerciseLibrary()
    let activeDays: Int
    var weight: Double
    var male: Bool
    var experience: Int
    
    init(weight: Double, male: Bool, experience: Int, activeDays: Int){
        self.weight = weight
        self.male = male
        self.experience = experience
        self.activeDays = activeDays
    }
        
    func SBD_Generator(workoutNumber: Int)->[[String]]{
        var collection = [[String]]()
        var upperbound: Int
        var extraMuscleGroup: String
        var exercisePlan = ["ChestPrimary","BackPrimary","LegsPrimary","Shoulders"]
        var templateExercise = [Exercise]()
        let randomExtraExercise = Int.random(in: 0...1)
        
        //If the user is sufficiently experienced, give them an extra exercise in their routine
        if(self.experience > 2){
            if(randomExtraExercise == 0){
                extraMuscleGroup = "ChestSecondary"
            } else{
                extraMuscleGroup = "BackSecondary"
            }
            upperbound = 5
            exercisePlan.append(extraMuscleGroup)
        } else {
            upperbound = 4
        }
        
        //Generates exercise
        for i in 0...(upperbound-1){
            switch exercisePlan[i]{
                case "ChestPrimary":
                    templateExercise = exerciseLib.ChestPrimary
                case "BackPrimary":
                    templateExercise = exerciseLib.BackPrimary
                case "LegsPrimary":
                    templateExercise = exerciseLib.LegsPrimary
                case "Shoulders":
                    templateExercise = exerciseLib.Shoulders
                case "ChestSecondary":
                    templateExercise = exerciseLib.ChestSecondary
                case "BackSecondary":
                    templateExercise = exerciseLib.BackSecondary
                default: print("Error: Muscle Group Not Found")
            }
            
            let numberOfExercises = templateExercise.count
            let randomExerciseIndex = Int.random(in: 0..<numberOfExercises)
            let exerciseSelected = templateExercise[randomExerciseIndex]
            var exerciseWeight: Double
            
            if(self.male){
                exerciseWeight = exerciseSelected.maleScale[self.experience] * self.weight
            } else {
                exerciseWeight = exerciseSelected.femaleScale[self.experience] * self.weight
            }
            
            //Rounds weight to the nearest 2.5 lbs
            exerciseWeight = (Double(Float(exerciseWeight*10) ⌈/⌉* 25))*0.1
    
            let newExercise = [exerciseSelected.info[0],
                               exerciseSelected.info[1],
                               exerciseSelected.info[2],
                               exerciseSelected.info[3],
                               exerciseSelected.info[4],
                               String(exerciseWeight)]
            collection.append(newExercise)
        }
        //fills in the empty slots
        for _ in upperbound...10{
            let emptyExercise = ["N/A","N/A","N/A","N/A","N/A","N/A"]
            collection.append(emptyExercise)
        }
        return collection
    }
    
    func PPL_Generator(workoutNumber: Int)->[[String]]{
        var collection = [[String]]()
        var upperbound: Int
        var extraMuscleGroup: String
        var exercisePlan = [""]
        var templateExercise = [Exercise]()
        
        switch(workoutNumber){
            case 1:
                exercisePlan = ["ChestPrimary","ChestSecondary","ChestTertiary","TricepPrimary","TricepSecondary"]
            case 2:
                exercisePlan = ["BackPrimary","BackSecondary","BackTertiary","BicepPrimary","BicepSecondary"]
            case 3:
                exercisePlan = ["LegsPrimary","LegsSecondary","LegsTertiary","Shoulders"]
            case 4:
                exercisePlan = ["ChestPrimary","ChestSecondary","ChestTertiary", "TricepPrimary","TricepSecondary"]
            case 5:
                exercisePlan = ["BackPrimary","BackSecondary","BackTertiary","BicepPrimary","BicepSecondary"]
            case 6:
                exercisePlan = ["LegsPrimary","LegsSecondary","LegsTertiary","Shoulders"]
            default:
                print("Error: Index out of range")
        }
        
        //Generates exercise
        for i in 0...(exercisePlan.count-1){
            switch exercisePlan[i]{
                case "ChestPrimary":
                    templateExercise = exerciseLib.ChestPrimary
                case "ChestSecondary":
                    templateExercise = exerciseLib.ChestSecondary
                case "TricepPrimary":
                    templateExercise = exerciseLib.TricepPrimary
                case "TricepSecondary":
                    templateExercise = exerciseLib.TricepSecondary
                case "BackPrimary":
                    templateExercise = exerciseLib.BackPrimary
                case "BackSecondary":
                    templateExercise = exerciseLib.BackSecondary
                case "BackTertiary":
                    templateExercise = exerciseLib.BackTertiary
                case "BicepPrimary":
                    templateExercise = exerciseLib.BicepPrimary
                case "BicepSecondary":
                    templateExercise = exerciseLib.BicepSecondary
                case "LegsPrimary":
                    templateExercise = exerciseLib.LegsPrimary
                case "LegsSecondary":
                    templateExercise = exerciseLib.LegsSecondary
                case "LegsTertiary":
                    templateExercise = exerciseLib.LegsTertiary
                case "Shoulders":
                    templateExercise = exerciseLib.Shoulders
                default: print("Error: Muscle Group Not Found")
            }
            
            let numberOfExercises = templateExercise.count
            print(templateExercise)
            let randomExerciseIndex = Int.random(in: 0..<numberOfExercises)
            let exerciseSelected = templateExercise[randomExerciseIndex]
            var exerciseWeight: Double
            
            if(self.male){
                exerciseWeight = exerciseSelected.maleScale[self.experience] * self.weight
            } else {
                exerciseWeight = exerciseSelected.femaleScale[self.experience] * self.weight
            }
            
            //Rounds weight to the nearest 2.5 lbs
            exerciseWeight = (Double(Float(exerciseWeight*10) ⌈/⌉* 25))*0.1
    
            let newExercise = [exerciseSelected.info[0],
                               exerciseSelected.info[1],
                               exerciseSelected.info[2],
                               exerciseSelected.info[3],
                               exerciseSelected.info[4],
                               String(exerciseWeight)]
            collection.append(newExercise)
        }
        //fills in the empty slots
        for _ in (exercisePlan.count)...10{
            let emptyExercise = ["N/A","N/A","N/A","N/A","N/A","N/A"]
            collection.append(emptyExercise)
        }
        return collection
    }
    
    func generate(workoutNumber: String){
        //if day == 1 || day ==  2 (create SBD workout plan)  <== CREATING THIS
        //if day == 6 || day ==  2 (create SBD workout plan)
        
        var documentName = ""
        let workoutType = Int(workoutNumber)!
    
        let exerciseCollection: [[String]]
    
        if(activeDays <= 2){
            documentName = "SBD_Workout_" + workoutNumber
            exerciseCollection = self.SBD_Generator(workoutNumber: workoutType)
            
        } else if(activeDays == 3 || activeDays == 6){
            documentName = "PPL_Workout_" + workoutNumber
            exerciseCollection = self.PPL_Generator(workoutNumber: workoutType)
        
        } else {
            documentName = "SBD_Workout_" + workoutNumber
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

infix operator ⌈/⌉*

extension Float {
  static func ⌈/⌉* (_ value: Float, _ multiples: Int) -> Int {
    precondition(multiples > 0, "multiples has to be positive")

    return Int((value / Float(multiples)).rounded(.up)) * multiples
  }
}

