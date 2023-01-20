//
//  NutritionStats.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit
import Charts
import Firebase

class NutritionStats: UIViewController {
    
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet var pieView: PieChartView!
    
    let db = Firestore.firestore()
    
    //GOALS: 0 - Losing weight, 1 - Maintain weight, 2 - Gain weight
    
    //OLD USE OF THE NUTRIENT ANALYSIS STRUCT
    var foodWizard = NutrientAnalysis(height: 0, weight: 0, goal: 0, male: false, activity: 0, age: 0)
    
    //var foodWizard = NutrientAnalysis()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //The code here sets up the user's data received from Firebase
        
        let userEmail = String(Auth.auth().currentUser!.email ?? "no email")
        
        db.collection("UserData")
            .whereField("email", isEqualTo: userEmail)
            .order(by: "date", descending: true)
            .limit(to: 1)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    print("oops")
                } else {
                    for doc in querySnapshot!.documents {
                        
                        let data = doc.data()
                          
                        DispatchQueue.main.async {
                            let setHeight = (data["height"] as? Double)!
                            let setWeight = (data["weight"] as? Double)!
                            let setGoal = (data["goal"] as? Int)!
                            let setMale = (data["sex"] as? Bool)!
                            let setActivity = (data["activity"] as? Int)!
                            let setAge = (data["age"] as? Int)!
                            self.foodWizard.updateInfo(height: setHeight, weight: setWeight, goal: setGoal, male: setMale, activity: setActivity, age: setAge)
                            self.setupPieChart()
                        }
                    }
                }
        }
        
        //The code below generates the macronutrient pie chart
        print("chart constructed")
        
        
        print("Chart Data: This user is \(foodWizard.height)cm tall")
        calorieLabel.text = String(format: "%.2f" + " kCal", foodWizard.getCalories())
        carbLabel.text = "\(foodWizard.getCarbs()) grams"
        proteinLabel.text = "\(foodWizard.getProtein()) grams"
        fatsLabel.text = "\(foodWizard.getFats()) grams"
        print("this user is \(foodWizard.height)cm tall")
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
        
        
        //CHANGE THIS CODE
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
