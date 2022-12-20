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
    var fullVideo: UIImage      //full video of the exercise, only play during first time (or press the info button)
    var preview: String         //exercise demo clip
    var exercisetime: Int       //time given to complete exercise
    var restTime: Int           //time given for rest
    
    init(name: String, order: Int, fullVideo: UIImage, preview: String, exercisetime: Int, restTime: Int) {
        self.name = name
        self.order = order
        self.fullVideo = fullVideo
        self.preview = preview
        self.exercisetime = exercisetime
        self.restTime = restTime
    }
}
