//
//  NutritionStats.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit

class NutritionStats: UIViewController {
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    var foodWizard = NutrientAnalysis(height: 186, weight: 90.9, gain: false, lose: false, maintain: true, male: true, activity: 2, age: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calorieLabel.text = String(format: "%.2f" + " kCal", foodWizard.getCalories())
        carbLabel.text = "\(foodWizard.getCarbs()) grams"
        proteinLabel.text = "\(foodWizard.getProtein()) grams"
        fatsLabel.text = "\(foodWizard.getFats()) grams"
    
    }
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        print("chewbacca")
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
}
