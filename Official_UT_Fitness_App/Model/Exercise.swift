//
//  Exercise.swift
//  BMI Calculator
//
//  Created by Leon Lee on 2022-11-15.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct Exercise{
    var name : String           //exercise name
    var order : Int             //which order the exercise appears in the workout plan
    var exercisetime: Int       //time given to complete a single set
    var restTime: Int           //time given for rest between sets
    var weight: Double          //resistance load
    
    init(name: String, order: Int, exercisetime: Int, restTime: Int) {
        self.name = name
        self.order = order
        self.exercisetime = exercisetime
        self.restTime = restTime
        self.weight = 0
    }
    
//    mutating func setExerciseInfo(weight: Double){
//        self.weight = bodyMass * Double (self.exerciseExp)
//    }
//
//    mutating func changeDiff{
//
//    }

}
