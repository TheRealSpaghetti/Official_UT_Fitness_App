//
//  NutritionStats.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    override func viewDidLoad() {
        
        //Login and Register
        //save user defaults to skip
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func leftSwipe(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        print("wowee!")
        self.performSegue(withIdentifier: "goToNutrition", sender: self)
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("swipe detected")
        self.performSegue(withIdentifier: "goToNutrition", sender: self)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToTimer", sender: self)
    }
    
    @IBAction func goToUserData(_ sender: UIButton) {
        self.performSegue(withIdentifier: "HomeToInfo", sender: self)
    }
    
    @IBAction func goToGeneratePage(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGeneratePage", sender: self)
    }
}
