//
//  NutritionStats.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit
import Charts

class NutritionStats: UIViewController {
    
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet var pieView: PieChartView!
    
    //GOALS: 0 - Losing weight, 1 - Maintain weight, 2 - Gain weight
    
    var foodWizard = NutrientAnalysis(height: 150, weight: 36 , goal: 0, male: false, activity: 2, age: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //The code here sets up the user's data received from Firebase
        
        //The code below generates the macronutrient pie chart
//        setupPieChart()
//        print("chart constructed")
//        
//        calorieLabel.text = String(format: "%.2f" + " kCal", foodWizard.getCalories())
//        carbLabel.text = "\(foodWizard.getCarbs()) grams"
//        proteinLabel.text = "\(foodWizard.getProtein()) grams"
//        fatsLabel.text = "\(foodWizard.getFats()) grams"
    }

    //function to add data to pie chart
    func setupPieChart(){
        print("unga bunga")
        pieView.chartDescription.enabled = false
        pieView.drawHoleEnabled = false
        pieView.rotationAngle = 0
        pieView.rotationEnabled = true
        pieView.isUserInteractionEnabled = false
        pieView.legend.enabled = false
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 50, label: "Fat"))
        entries.append(PieChartDataEntry(value: 30, label: "Protein"))
        entries.append(PieChartDataEntry(value: 20, label: "Carbohydrates"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        let c1 = NSUIColor(red: 255, green: 153, blue: 0)
        let c2 = NSUIColor(red: 57, green: 240, blue: 119)
        let c3 = NSUIColor(red: 171, green: 71, blue: 188)
        
        dataSet.colors = [c1, c2, c3]
        dataSet.drawValuesEnabled = false
        
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        print("chewbacca")
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
}
