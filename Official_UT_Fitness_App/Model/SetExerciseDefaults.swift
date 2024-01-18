//
//  SetExerciseDefaults.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-11-26.
//

import Foundation
import Firebase

struct SessionCreator{
    
    let db = Firestore.firestore()
    let userEmail = String(Auth.auth().currentUser!.email ?? "no email")
    
    
    
    
}
