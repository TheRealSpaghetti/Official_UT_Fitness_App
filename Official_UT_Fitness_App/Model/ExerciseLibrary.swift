//
//  Exercise.swift
//  BMI Calculator
//
//  Created by Leon Lee on 2022-11-15.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct Exercise {
//MARK: -  PUSH EXERCISES
    struct ChestPrimary {
        struct Benchpress{
            //Exercise Information
            static let exerciseName = "Bench Press"
            static let setTime = "100"
            static let restTime = "210"
            static let rep = "5"
            static let set = "5"
            //Strength Standards for Men
            static let male_level_0 = 0.4       //No formal training whatsoever
            static let male_level_1 = 0.5       //Beginner
            static let male_level_2 = 0.75      //Novice
            static let male_level_3 = 1.25      //Intermediate
            static let male_level_4 = 1.75      //Advanced
            static let male_level_5 = 2.00      //Elite
            //Strength Standards for Women
            static let female_level_0 = 0.20
            static let female_level_1 = 0.25
            static let female_level_2 = 0.50
            static let female_level_3 = 0.75
            static let female_level_4 = 1.00
            static let female_level_5 = 1.50
        }
        
        struct DumbbellChestPress{
            //Exercise Information
            static let exerciseName = "Dumbbell Bench Press"
            static let setTime = "45"
            static let restTime = "90"
            static let rep = "8"
            static let set = "4"
            //Strength Standards for Men
            static let male_level_0 = 0.15
            static let male_level_1 = 0.20
            static let male_level_2 = 0.35
            static let male_level_3 = 0.50
            static let male_level_4 = 0.75
            static let male_level_5 = 1.00
            //Strength Standards for Women
            static let female_level_0 = 0.075
            static let female_level_1 = 0.10
            static let female_level_2 = 0.20
            static let female_level_3 = 0.30
            static let female_level_4 = 0.50
            static let female_level_5 = 0.70
        }
        
        struct InclinedBenchPress{
            //Exercise Information
            static let exerciseName = "Inclined Bench Press"
            static let setTime = "100"
            static let restTime = "210"
            static let rep = "5"
            static let set = "5"
            //Strength Standards for Men
            static let male_level_0 = 0.4
            static let male_level_1 = 0.5
            static let male_level_2 = 0.75
            static let male_level_3 = 1.0
            static let male_level_4 = 1.5
            static let male_level_5 = 1.75
            //Strength Standards for Women
            static let female_level_0 = 0.15
            static let female_level_1 = 0.20
            static let female_level_2 = 0.40
            static let female_level_3 = 0.65
            static let female_level_4 = 1.00
            static let female_level_5 = 1.40
        }
    }

    struct ChestSecondary {
    }
    
    struct TricepPrimary {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
//MARK: - PULL EXERCISES
    struct BackPrimary {
            struct LatPullDown{
                //Exercise Information
                static let exerciseName = "Lat Pulldown"
                static let setTime = "60"
                static let restTime = "210"
                static let rep = "5"
                static let set = "5"
                //Strength Standards for Men
                static let male_level_0 = 0.4
                static let male_level_1 = 0.5
                static let male_level_2 = 0.75
                static let male_level_3 = 1.0
                static let male_level_4 = 1.5
                static let male_level_5 = 1.75
                //Strength Standards for Women
                static let female_level_0 = 0.20
                static let female_level_1 = 0.30
                static let female_level_2 = 0.45
                static let female_level_3 = 0.70
                static let female_level_4 = 0.95
                static let female_level_5 = 1.00
            }
        
            struct DumbbellRow{
                //Exercise Information
                static let exerciseName = "Dumbbell Row"
                static let setTime = "60"
                static let restTime = "120"
                static let rep = "8"
                static let set = "4"
                //Strength Standards for Men
                static let male_level_0 = 0.15
                static let male_level_1 = 0.20
                static let male_level_2 = 0.35
                static let male_level_3 = 0.55
                static let male_level_4 = 0.8
                static let male_level_5 = 1.05
                //Strength Standards for Women
                static let female_level_0 = 0.05
                static let female_level_1 = 0.10
                static let female_level_2 = 0.20
                static let female_level_3 = 0.35
                static let female_level_4 = 0.50
                static let female_level_5 = 0.65
            }
    }
    
    struct BackSecondary {
            struct SeatedCableRow{
                //Exercise Information
                static let exerciseName = "SeatedCableRow"
                static let setTime = "60"
                static let restTime = "150"
                static let rep = "5"
                static let set = "5"
                //Strength Standards for Men
                static let male_level_0 = 0.40
                static let male_level_1 = 0.50
                static let male_level_2 = 0.75
                static let male_level_3 = 1.00
                static let male_level_4 = 1.50
                static let male_level_5 = 2.00
                //Strength Standards for Women
                static let female_level_0 = 0.20
                static let female_level_1 = 0.30
                static let female_level_2 = 0.50
                static let female_level_3 = 0.75
                static let female_level_4 = 1.00
                static let female_level_5 = 1.35
            }
            struct BentOverRow{
                //Exercise Information
                static let exerciseName = "Bent Over Row"
                static let setTime = "60"
                static let restTime = "150"
                static let rep = "5"
                static let set = "5"
                //Strength Standards for Men
                static let male_level_0 = 0.40
                static let male_level_1 = 0.50
                static let male_level_2 = 0.75
                static let male_level_3 = 1.00
                static let male_level_4 = 1.50
                static let male_level_5 = 1.75
                //Strength Standards for Women
                static let female_level_0 = 0.15
                static let female_level_1 = 0.25
                static let female_level_2 = 0.40
                static let female_level_3 = 0.65
                static let female_level_4 = 0.90
                static let female_level_5 = 1.20
            }
    }

    struct BackTertiary {
            struct ReverseFly{
                //Exercise Information
                static let exerciseName = "Reverse Fly"
                static let setTime = "75"
                static let restTime = "100"
                static let rep = "8"
                static let set = "4"
                //Strength Standards for Men
                static let male_level_0 = 0.15
                static let male_level_1 = 0.25
                static let male_level_2 = 0.50
                static let male_level_3 = 0.75
                static let male_level_4 = 1.25
                static let male_level_5 = 1.75
                //Strength Standards for Women
                static let female_level_0 = 0.05
                static let female_level_1 = 0.05
                static let female_level_2 = 0.10
                static let female_level_3 = 0.20
                static let female_level_4 = 0.35
                static let female_level_5 = 0.55
            }
            struct DumbbellReverseFly{
                //Exercise Information
                static let exerciseName = "Dumbbell Reverse Fly"
                static let setTime = "60"
                static let restTime = "150"
                static let rep = "8"
                static let set = "4"
                //Strength Standards for Men
                static let male_level_0 = 0.05
                static let male_level_1 = 0.05
                static let male_level_2 = 0.10
                static let male_level_3 = 0.25
                static let male_level_4 = 0.40
                static let male_level_5 = 0.60
                //Strength Standards for Women
                static let female_level_0 = 0.05
                static let female_level_1 = 0.05
                static let female_level_2 = 0.10
                static let female_level_3 = 0.15
                static let female_level_4 = 0.25
                static let female_level_5 = 0.40
            }
    }
    
//MARK: - LEG EXERCISES
    struct LegsPrimary {
        struct Squat{
            //Exercise Information
            static let exerciseName = "Squat"
            static let setTime = "60"
            static let restTime = "210"
            static let rep = "5"
            static let set = "5"
            //Strength Standards for Men
            static let male_level_0 = 0.60
            static let male_level_1 = 0.75
            static let male_level_2 = 1.25
            static let male_level_3 = 1.50
            static let male_level_4 = 2.25
            static let male_level_5 = 2.75
            //Strength Standards for Women
            static let female_level_0 = 0.40
            static let female_level_1 = 0.50
            static let female_level_2 = 0.75
            static let female_level_3 = 1.25
            static let female_level_4 = 1.50
            static let female_level_5 = 2.00
        }
        
        struct Deadlift{
            //Exercise Information
            static let exerciseName = "Deadlift"
            static let setTime = "60"
            static let restTime = "210"
            static let rep = "5"
            static let set = "5"
            //Strength Standards for Men
            static let male_level_0 = 0.80
            static let male_level_1 = 1.00
            static let male_level_2 = 1.50
            static let male_level_3 = 2.00
            static let male_level_4 = 2.50
            static let male_level_5 = 3.00
            //Strength Standards for Women
            static let female_level_0 = 0.40
            static let female_level_1 = 0.50
            static let female_level_2 = 1.00
            static let female_level_3 = 1.25
            static let female_level_4 = 1.75
            static let female_level_5 = 2.50
        }
    }
    
    struct Shoulders {
    }
    
}
