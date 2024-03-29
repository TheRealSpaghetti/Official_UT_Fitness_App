//
//  NutritionAnaylsis.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-19.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import Foundation
import Firebase

struct NutrientAnalysis{
    
    let db = Firestore.firestore()
    var height: Double       //height in centimeters
    var weight: Double       //weight in kilograms
    var goal: Int            //GOALS: 0 - Losing weight, 1 - Maintain weight, 2 - Gain weight
    var male: Bool
    var activity: Int
    var age: Int
    var genderMult: Double
    var macroArray: [Double] = [0,0,0]
        
    init(height: Double, weight: Double, goal: Int, male: Bool, activity: Int, age: Int) {
        self.height = height
        self.weight = weight
        self.goal = goal
        self.male = male
        self.activity = activity
        self.age = age
  
        if(male == true){
            genderMult = 1.0
        } else {
            genderMult = 0.9
        }
        
        if(goal == 2){                 //**Gaining weight**
            macroArray[0] = 0.20            //Protein
            macroArray[1] = 0.45            //Carbs
            macroArray[2] = 0.35            //Fats
        } else if(goal == 1){          //**Maintaining weight**
            macroArray[0] = 0.20
            macroArray[1] = 0.45
            macroArray[2] = 0.35
        } else {                       //**Losing weight**
            macroArray[0] = 0.30
            macroArray[1] = 0.30
            macroArray[2] = 0.40
        }
    }
    
    mutating func updateInfo(height: Double, weight: Double, goal: Int, male: Bool, activity: Int, age: Int){

        print("info updated successfully")
        
        self.height = height
        self.weight = weight
        self.goal = goal
        self.male = male
        self.activity = activity
        self.age = age
    
        if(male == true){
            genderMult = 1.0
        } else {
            genderMult = 0.9
        }
        
        if(goal == 2){                 //**Gaining weight**
            macroArray[0] = 0.20            //Protein
            macroArray[1] = 0.45            //Carbs
            macroArray[2] = 0.35            //Fats
        } else if(goal == 1){          //**Maintaining weight**
            macroArray[0] = 0.20
            macroArray[1] = 0.45
            macroArray[2] = 0.35
        } else {                       //**Losing weight**
            macroArray[0] = 0.30
            macroArray[1] = 0.30
            macroArray[2] = 0.40
        }
        
        print("this user is \(self.height)cm tall")
    }
    
    func getHeight() -> Int{
        return Int(self.height)
    }
    
    func getWeight() -> Int{
        return Int(self.weight)
    }
    
    func getGender() -> Bool{
        return Bool(self.male)
    }
    
    func getActivity() -> Int{
        return Int(self.activity)
    }
    
    func getDiet() -> Int{
        return Int(self.goal)
    }
    
    func getProtein() -> Int{
        var dailyCals: Double {round(self.getCalories())}
        return Int(round((dailyCals * macroArray[0]) / 4))
    }
    
    func getCarbs() -> Int{
        var dailyCals: Double {round(self.getCalories())}
        return Int(round((dailyCals * macroArray[1]) / 4))
    }
    
    func getFats() -> Int{
        var dailyCals: Double {round(self.getCalories())}
        return Int(round((dailyCals * macroArray[2]) / 9))
    }
    
    func getCalories() -> Double {
        var activityModifier: Double
        var goalModifier: Double
        var BMR: Double
        
        if(self.goal == 2){
            goalModifier = 300.0
        } else if(self.goal == 1){
            goalModifier = 0.0
        } else {
            goalModifier = -300.0
        }
        
        if(self.activity == 1){
            activityModifier = 1.2
        } else if (self.activity == 2){
            activityModifier = 1.375
        } else if (self.activity == 3){
            activityModifier = 1.55
        } else if (self.activity == 4){
            activityModifier = 1.725
        } else{
            activityModifier = 1.9
        }
        
        if(male == true){
            
            BMR = 88.362 + (13.397 * self.weight) + (4.799 * self.height) - (5.677 * Double(self.age))
            
            return (BMR * activityModifier) + goalModifier
            
        } else {
            
            BMR = 447.593 + (9.247 * self.weight) + (3.098 * self.height) - (4.330 * Double (self.age))
            
            return (BMR * activityModifier) + goalModifier
        }
    }
    
    func getBMI() -> Double {
        return self.weight/pow(self.height, 2)
    }
}
