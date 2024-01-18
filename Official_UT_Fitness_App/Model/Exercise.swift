//
//  Exercise.swift
//  Official_UT_Fitness_App
//
//  Created by Leon Lee on 2023-02-10.
//

import Foundation

struct Exercise{
    let info: [String]
    let maleScale: [Double]
    let femaleScale: [Double]
    
    init(information: [String], maleMult: [Double], femaleMult: [Double]) {
        info = information
        maleScale = maleMult
        femaleScale = femaleMult
    }
}
