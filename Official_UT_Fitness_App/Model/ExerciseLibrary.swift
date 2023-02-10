//
//  Created by Leon Lee on 2022-11-15.
//
import Foundation
import UIKit
//Exercise Structs:
//Info: ["Exercise Name", "Set/Time", "rest Time", "# of reps", # of sets]
//

struct Exercise {
//MARK: -  PUSH EXERCISES
    struct ChestPrimary {
            struct __1{
                //Exercise Information
                static let info = ["Bench Press", "100", "210", "5" , "5"]
                //Strength Standards for Men
                static let male_scale = [0.40, 0.50, 0.75, 1.25, 1.75, 2.00]
                //Strength Standards for Women
                static let female_scale = [0.20, 0.25, 0.50, 0.75, 1.00, 1.50]
            }
            struct __2{
                static let info = ["Dumbbell Bench Press", "45", "90", "8" , "4"]
                static let male_scale = [0.15, 0.20, 0.35, 0.50, 0.75, 1.00]
                static let female_scale = [0.075, 0.10, 0.20, 0.30, 0.50, 0.70]
            }
            struct __3{
                static let info = ["Inclined Bench Press", "100", "210", "5" , "5"]
                static let male_scale = [0.40, 0.50, 0.75, 1.00, 1.50, 1.75]
                static let female_scale = [0.15, 0.20, 0.40, 0.65, 1.00, 1.40]
            }
    }
    struct ChestSecondary {
            struct __1{
                static let info = ["Pec Fly", "60", "30", "8" , "4"]
                static let male_scale = [0.05, 0.10, 0.25, 0.50, 0.85, 1.35]
                static let female_scale = [0.05, 0.10, 0.15, 0.30, 0.55, 0.80]
            }
            struct __2{
                static let info = ["Cable Chest Fly", "60", "30", "8" , "4"]
                static let male_scale = [0.05, 0.10, 0.25, 0.50, 0.85, 1.35]
                static let female_scale = [0.05, 0.10, 0.15, 0.30, 0.55, 0.80]
            }
    }
    struct TricepPrimary {
    }
    
//MARK: - PULL EXERCISES
    struct BackPrimary {
            struct __1{
                static let info = ["Lat Pulldown", "60", "210", "5" , "5"]
                static let male_scale = [0.40, 0.50, 0.75, 1.00, 1.50, 1.75]
                static let female_scale = [0.20, 0.30, 0.45, 0.70 ,0.95, 1.00]
            }
            struct __2{
                static let info = ["Dumbbell Row", "60", "120", "8" , "4"]
                static let male_scale = [0.15, 0.20, 0.35, 0.55, 0.80, 1.05]
                static let female_scale = [0.05, 0.10, 0.20, 0.35 ,0.50, 0.65]
            }
    }
    struct BackSecondary {
            struct __1{
                static let info = ["Seated Cable Row", "60", "150", "5" , "5"]
                static let male_scale = [0.40, 0.50, 0.75, 1.00, 1.50, 2.00]
                static let female_scale = [0.20, 0.30, 0.50, 0.75 ,1.00, 1.35]
            }
            struct __2{
                static let info = ["Bent Over Row", "60", "150", "5" , "5"]
                static let male_scale = [0.40, 0.50, 0.75, 1.00, 1.50, 1.75]
                static let female_scale = [0.15, 0.25, 0.40, 0.65 ,0.90, 1.20]
            }
    }
    
    struct BackTertiary {
            struct __1{
                static let info = ["Reverse Fly", "75", "100", "8" , "4"]
                static let male_scale = [0.15, 0.25, 0.50, 0.75, 1.25, 1.75]
                static let female_scale = [0.05, 0.05, 0.10, 0.20,0.35, 0.55]
                }
           struct __2{
                static let info = ["Dumbbell Reverse Fly", "60", "150", "8" , "4"]
                static let male_scale = [0.05, 0.05, 0.10, 0.25, 0.40, 0.60]
                static let female_scale = [0.05, 0.05, 0.10, 0.15, 0.25, 0.40]
            }
    }
    
//MARK: - LEG EXERCISES
    struct LegsPrimary {
            struct __1{
                static let info = ["Squat", "60", "210", "5" , "5"]
                static let male_scale = [0.60, 0.75, 1.25, 1.50, 2.25, 2.75]
                static let female_scale = [0.40, 0.50, 0.75, 1.25, 1.50, 2.00]
            }
            struct __2{
                static let info = ["Deadlift", "60", "210", "5" , "5"]
                static let male_scale = [0.80, 1.00, 1.50, 2.00, 2.50, 3.00]
                static let female_scale = [0.40, 0.50, 1.00, 1.25, 1.75, 2.50]
            }
    }
    
//MARK: - SHOULDER EXERCISES
    struct Shoulders {
            struct __1{
                static let info = ["Lateral Raise", "45", "30", "8" , "3"]
                static let male_scale = [0.05, 0.05, 0.10, 0.20, 0.30, 0.45]
                static let female_scale = [0.05, 0.05, 0.10, 0.15, 0.25, 0.30]
            }
            struct __2{
                static let info = [ "Front Raises", "45", "30", "8" , "4"]
                static let male_scale = [0.05, 0.05, 0.10, 0.25, 0.40, 0.55]
                static let female_scale = [0.05, 0.05, 0.10, 0.15, 0.25, 0.40]
            }
            struct __3{
                static let info = ["Shoudler Press", "45", "45", "10" , "3"]
                static let male_scale = [0.10, 0.15, 0.25, 0.40, 0.60, 0.75]
                static let female_scale = [0.05, 0.10, 0.15, 0.25, 0.35, 0.50]
            }
            struct __4{
                static let info = ["Cable Lateral Raises", "45", "30", "10" , "3"]
                static let male_scale = [0.05, 0.10, 0.15, 0.25, 0.45, 0.75]
                static let female_scale = [0.05, 0.05, 0.10, 0.15, 0.25, 0.35]
            }
    }
}
