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
    
    let db = Firestore.firestore()
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet var pieView: PieChartView!
    
    //GOALS: 0 - Losing weight, 1 - Maintain weight, 2 - Gain weight
    var foodWizard = NutrientAnalysis(height: 0, weight: 0, goal: 0, male: false, activity: 0, age: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Code Segment: Reads User Data from Firebase
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
                          
                        //Code Segment: Sets User Stats from data retrieved from Firebase
                        //TO DO: Make sure not to allow info update unless user has checked all boxes
                        DispatchQueue.main.async { [self] in
                            let setHeight = (data["height"] as? Double)!
                            let setWeight = (data["weight"] as? Double)!
                            let setGoal = (data["goal"] as? Int)!
                            let setMale = (data["sex"] as? Bool)!
                            let setActivity = (data["activity"] as? Int)!
                            let setAge = (data["age"] as? Int)!
                            
                            //Code Segment: Generates Pie Chart
                            self.foodWizard.updateInfo(height: setHeight, weight: setWeight, goal: setGoal, male: setMale, activity: setActivity, age: setAge)
                            self.setupPieChart()
                            print(foodWizard.getCalories())
                            //self.calorieLabel.text = String(format: "%.2f" + " kCal", foodWizard.getCalories())
                            //self.carbLabel.text = "\(foodWizard.getCarbs()) grams"
                            //self.proteinLabel.text = "\(foodWizard.getProtein()) grams"
                            //self.fatsLabel.text = "\(foodWizard.getFats()) grams"
                        }
                    }
                }
        }
    }

    //function to add data to pie chart
    func setupPieChart(){
        pieView.chartDescription.enabled = false
        pieView.drawHoleEnabled = false
        pieView.rotationAngle = 0
        pieView.rotationEnabled = true
        pieView.isUserInteractionEnabled = false
        pieView.legend.enabled = false
        
        //CHANGE THIS CODE
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: foodWizard.macroArray[0], label: "Protein"))
        entries.append(PieChartDataEntry(value: foodWizard.macroArray[1], label: "Carbohydrates"))
        entries.append(PieChartDataEntry(value: foodWizard.macroArray[2], label: "Fats"))
        
        //Code Segment: Sets color of each area of the pie chart
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
