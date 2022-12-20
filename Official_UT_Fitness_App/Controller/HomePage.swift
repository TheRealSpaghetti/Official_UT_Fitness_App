//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class HomePage: UIViewController {

    override func viewDidLoad() {
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
    
}

