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
    
    func generate(day: String){
        let documentName = "Workout_" + day
        var yourArray = [String]()
        yourArray.append("String Value")
        yourArray.append("String Value1")
        yourArray.append("String Value2")
        db.collection(documentName).addDocument(data: [
                    "height": yourArray
                ]){(error) in
                    if let e = error {
                        print(e)
                    } else {
                        print("Successfully generated workout plan")
                    }
                }
            }

}
