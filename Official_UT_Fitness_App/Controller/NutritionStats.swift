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
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var phaseLabel: UILabel!
    
    @IBOutlet var pieView: PieChartView!
    
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
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
                           
                            
                            //Prints biometric data onto respective labels
                            self.heightLabel.text = "\(foodWizard.getHeight()) cm"
                            self.weightLabel.text = "\(foodWizard.getWeight()) kg"
                            
                            if(foodWizard.getGender() == true){
                                self.genderLabel.text = "Male"
                            } else {
                                self.genderLabel.text = "Female"
                            }
                            
                            let activityLevel = foodWizard.getActivity()
                            
                            switch activityLevel {
                            case 1:
                                self.activityLabel.text = "Stationary"
                            case 2:
                                self.activityLabel.text = "Sedentary"
                            case 3:
                                self.activityLabel.text = "Moderate"
                                
                            case 4:
                                self.activityLabel.text = "Vigorously"
                                
                            case 5:
                                self.activityLabel.text = "Extreme"

                            default:
                                print("Error, can't get activity data")
                                print(activityLevel)
                            }
                            
                            if(foodWizard.getDiet() == 0){
                                self.phaseLabel.text = "Cutting"
                            } else if (foodWizard.getDiet() == 1) {
                                self.phaseLabel.text = "Maintain"
                            } else {
                                self.phaseLabel.text = "Bulking"
                            }
                            
                            //Prints macros data onto respective labels
                            self.proteinLabel.text = "\(foodWizard.getProtein()) grams"
                            self.carbLabel.text = "\(foodWizard.getCarbs()) grams"
                            self.fatsLabel.text = "\(foodWizard.getFats()) grams"
                            self.calorieLabel.text = String(format: "%.1f" + " kCal", foodWizard.getCalories())
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
        entries.append(PieChartDataEntry(value: foodWizard.macroArray[1], label: "Carbs"))
        entries.append(PieChartDataEntry(value: foodWizard.macroArray[2], label: "Fats"))
        
        print("Protein: \(foodWizard.macroArray[0]), Carbs: \(foodWizard.macroArray[1]), Fats: \(foodWizard.macroArray[2])")
        
        //Code Segment: Sets color of each area of the pie chart
        let dataSet = PieChartDataSet(entries: entries, label: "")
        let c1 = NSUIColor(red: 255, green: 153, blue: 0)
        let c2 = NSUIColor(red: 57, green: 240, blue: 119)
        let c3 = NSUIColor(red: 171, green: 71, blue: 188)
        
        //Sets up the data on the pie chart
        dataSet.colors = [c1, c2, c3]
        dataSet.valueFont = UIFont(name: "Helvetica", size: 12)!
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        print("chewbacca")
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
}
