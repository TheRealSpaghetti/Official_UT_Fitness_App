//
//  Created by Leon Lee on 2022-11-15.
//

import Foundation
import UIKit
//Exercise Structs:
//Info: ["Exercise Name", "Set/Time", "rest Time", "# of reps", # of sets]
//Multipliers: [0] = No training, [1] = Beginner, [2] = Novice, [3] = Intermediate, [4] = Advanced, [5] = Elite
//

struct ExerciseLibrary {
    let ChestPrimary = [
        Exercise(information: ["Bench Press", "100", "210", "5" , "5"], maleMult: [0.40, 0.50, 0.75, 1.25, 1.75, 2.00], femaleMult: [0.20, 0.25, 0.50, 0.75, 1.00, 1.50]),
        
        Exercise(information: ["Dumbbell Bench", "45", "90", "8" , "4"], maleMult: [0.15, 0.20, 0.35, 0.50, 0.75, 1.00], femaleMult: [0.075, 0.10, 0.20, 0.30, 0.50, 0.70]),
        
        Exercise(information: ["Inclined Bench", "100", "210", "5" , "5"], maleMult: [0.40, 0.50, 0.75, 1.00, 1.50, 1.75], femaleMult: [0.15, 0.20, 0.40, 0.65, 1.00, 1.40])
    ]
    
    let ChestSecondary = [
        Exercise(information: ["Pec Fly (Machine)", "60", "30", "8" , "4"], maleMult: [0.05, 0.10, 0.25, 0.50, 0.85, 1.35], femaleMult: [0.05, 0.10, 0.15, 0.30, 0.55, 0.80]),
        
        Exercise(information: ["Cable Fly", "60", "30", "8" , "4"], maleMult: [0.05, 0.10, 0.25, 0.50, 0.85, 1.35], femaleMult: [0.05, 0.10, 0.15, 0.30, 0.55, 0.80]),
    ]
    
    let ChestTertiary = [
        Exercise(information: ["Cable Fly (Lower)", "60", "30", "10" , "3"], maleMult: [0.05, 0.10, 0.15, 0.25, 0.30, 0.40], femaleMult: [0.05, 0.10, 0.15, 0.20, 0.25, 0.30]),
        
        Exercise(information: ["Tricep Dips (Assisted)", "60", "30", "10" , "3"], maleMult: [0.85, 0.70, 0.50, 0.25, 0.10, 0.00], femaleMult: [0.85, 0.70, 0.50, 0.30, 0.15, 0.00])
    ]
    
    let TricepPrimary = [
        Exercise(information: ["Tricep Pushdown", "45", "60", "10" , "3"], maleMult: [0.15, 0.25, 0.50, 0.75, 1.00, 1.50], femaleMult: [0.10, 0.15, 0.25, 0.50, 0.75, 1.05]),
        
        Exercise(information: ["Dumbbell Tricep Extension", "45", "90", "10" , "3"], maleMult: [0.10, 0.15, 0.25, 0.40, 0.65, 0.85], femaleMult: [0.05, 0.10, 0.15, 0.20, 0.30, 0.45]),
        
        Exercise(information: ["Tricep Rope Pushdown", "45", "90", "10" , "3"], maleMult: [0.10, 0.20, 0.35, 0.60, 0.90, 1.25], femaleMult: [0.05, 0.10, 0.25, 0.40, 0.60, 0.85])
    ]
    
    let TricepSecondary = [
        Exercise(information: ["Tate Press", "45", "90", "10" , "3"], maleMult: [0.05, 0.10, 0.15, 0.25, 0.45, 0.65], femaleMult: [0.05, 0.10, 0.15, 0.20, 0.25, 0.40]),
        
        Exercise(information: ["Overhead Dumbbell Extension", "45", "90", "10" , "3"], maleMult: [0.10, 0.15, 0.25, 0.40, 0.65, 0.85], femaleMult: [0.05, 0.10, 0.15, 0.20, 0.30, 0.45])
    ]
    
    let BackPrimary = [
        Exercise(information: ["Lat Pulldown", "60", "210", "5" , "5"], maleMult: [0.40, 0.50, 0.75, 1.00, 1.50, 1.75], femaleMult: [0.20, 0.30, 0.45, 0.70 ,0.95, 1.00]),
        
        Exercise(information: ["Dumbbell Row", "60", "120", "8" , "4"], maleMult: [0.15, 0.20, 0.35, 0.55, 0.80, 1.05], femaleMult: [0.05, 0.10, 0.20, 0.35 ,0.50, 0.65]),
        
        Exercise(information: ["Reverse Grip Lat Pulldown", "60", "210", "5" , "5"], maleMult: [0.40, 0.50, 0.75, 1.25, 1.50, 2.00], femaleMult: [0.10, 0.15, 0.30, 0.60 ,0.95, 1.40])
    ]
    
    let BackSecondary = [
        Exercise(information: ["Seated Cable Row", "60", "120", "5" , "5"], maleMult: [0.40, 0.50, 0.75, 1.00, 1.50, 2.00], femaleMult: [0.20, 0.30, 0.50, 0.75 ,1.00, 1.35]),
        
        Exercise(information: ["Bent Over Row", "60", "150", "5" , "5"], maleMult: [0.40, 0.50, 0.75, 1.00, 1.50, 1.75], femaleMult: [0.15, 0.25, 0.40, 0.65 ,0.90, 1.20]),

        Exercise(information: ["Dumbbell Row", "60", "90", "5" , "5"], maleMult: [0.10, 0.20, 0.35, 0.55, 0.80, 1.05], femaleMult: [0.10, 0.10, 0.20, 0.35 ,0.50, 0.65])
    ]

    let BackTertiary = [
        Exercise(information: ["Reverse Fly", "75", "100", "8" , "4"], maleMult:  [0.15, 0.25, 0.50, 0.75, 1.25, 1.75], femaleMult: [0.05, 0.05, 0.10, 0.20,0.35, 0.55]),
        
        Exercise(information: ["Dumbbell Reverse Fly", "60", "150", "8" , "4"], maleMult: [0.05, 0.05, 0.10, 0.25, 0.40, 0.60], femaleMult: [0.05, 0.05, 0.10, 0.15, 0.25, 0.40]),
    ]
    
    let BicepPrimary = [
        Exercise(information: ["Preacher Curl", "45", "90", "10" , "3"], maleMult: [0.10, 0.20, 0.35, 0.60, 0.85, 1.10], femaleMult: [0.10, 0.15, 0.20, 0.40, 0.60, 0.85]),
        
        Exercise(information: ["Barbell Curl", "45", "90", "10" , "3"], maleMult: [0.20, 0.30, 0.40, 0.60, 0.85, 1.15], femaleMult: [0.10, 0.20, 0.30, 0.40, 0.60, 0.85]),
        
        Exercise(information: ["Machine Bicep Curl ", "45", "90", "10" , "3"], maleMult: [0.15, 0.25, 0.45, 0.75, 1.05, 1.40], femaleMult: [0.10, 0.20, 0.30, 0.40, 0.70, 1.00]),
        
        Exercise(information: ["Cable Bicep Curl ", "45", "90", "10" , "3"], maleMult: [0.15, 0.25, 0.35, 0.65, 1.05, 1.50], femaleMult: [0.10, 0.20, 0.30, 0.40, 0.70, 1.00])
    ]
    
    let BicepSecondary = [
        Exercise(information: ["Hammer Curl", "45", "90", "10" , "3"], maleMult: [0.05, 0.10, 0.20, 0.30, 0.45, 0.60], femaleMult: [0.05, 0.10, 0.15, 0.20, 0.30, 0.40]),
        
        Exercise(information: ["Dumbbell Curl", "45", "90", "10" , "3"], maleMult: [0.05, 0.10, 0.15, 0.30, 0.50, 0.65], femaleMult: [0.05, 0.10, 0.15, 0.20, 0.35, 0.45]),
        
        Exercise(information: ["Cross Body Curl", "45", "90", "10" , "3"], maleMult: [0.05, 0.10, 0.20, 0.30, 0.45, 0.60], femaleMult: [0.05, 0.10, 0.15, 0.20, 0.30, 0.40])
    ]
    
    let LegsPrimary = [
        Exercise(information: ["Squat", "60", "210", "5" , "5"], maleMult: [0.60, 0.75, 1.25, 1.50, 2.25, 2.75], femaleMult: [0.40, 0.50, 0.75, 1.25, 1.50, 2.00]),
        
        Exercise(information: ["Deadlift", "60", "210", "5" , "5"], maleMult: [0.80, 1.00, 1.50, 2.00, 2.50, 3.00], femaleMult: [0.40, 0.50, 1.00, 1.25, 1.75, 2.50]),
        
        Exercise(information: ["Front Squat", "60", "210", "5" , "5"], maleMult: [0.60, 0.75, 1.00, 1.25, 1.75, 2.25], femaleMult: [0.40, 0.50, 0.75, 1.00, 1.25, 1.50])
    ]
    
    let LegsSecondary = [
        Exercise(information: ["Leg Press", "60", "90", "10" , "3"], maleMult: [0.60, 1.00, 1.75, 2.75, 4.00, 5.25], femaleMult: [0.30, 0.50, 1.25, 2.00, 3.25, 4.50]),
        
        Exercise(information: ["Split Squat", "40", "90", "6" , "3"], maleMult: [0.15, 0.25, 0.75, 1.00, 1.75, 2.25], femaleMult: [0.15, 0.25, 0.50, 0.75, 1.25, 1.50])
    ]
    
    let LegsTertiary = [
        Exercise(information: ["Goblet Squat", "60", "90", "10" , "3"], maleMult: [0.20, 0.35, 0.45, 0.55, 0.85, 1.15], femaleMult: [0.10, 0.15, 0.25, 0.40, 0.60, 0.85]),
    ]
    
    let Shoulders = [
        Exercise(information: ["Lateral Raise", "45", "30", "8" , "3"], maleMult: [0.05, 0.05, 0.10, 0.20, 0.30, 0.45], femaleMult:  [0.05, 0.05, 0.10, 0.15, 0.25, 0.30]),
        
        Exercise(information: [ "Front Raises", "45", "30", "8" , "4"], maleMult: [0.05, 0.05, 0.10, 0.25, 0.40, 0.55], femaleMult: [0.05, 0.05, 0.10, 0.15, 0.25, 0.40]),
        
        Exercise(information: ["Shoulder Press", "45", "45", "10" , "3"], maleMult: [0.10, 0.15, 0.25, 0.40, 0.60, 0.75], femaleMult: [0.05, 0.10, 0.15, 0.25, 0.35, 0.50]),
        
        Exercise(information: ["Cable Lateral Raises", "45", "30", "10" ,"3"], maleMult: [0.05, 0.10, 0.15, 0.25, 0.45, 0.75], femaleMult: [0.05, 0.05, 0.10, 0.15, 0.25, 0.35])
    ]
}
