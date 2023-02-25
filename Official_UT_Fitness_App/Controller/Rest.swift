//
//  RestScreen.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit

class RestScreen: UIViewController {
    
    var exitStatus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        var testArray = defaults.object(forKey:"Exercises_Left") as? [Int] ?? [Int]()
        
        if(testArray.isEmpty){
            print("case 1\n")
            print("array is empty")
            exitStatus = true
        } else if(testArray[0] != 0){
            print("case 2\n")
            testArray[0] -= 1
        } else if(testArray[0] == 0){
            //code to finish workout because necessary condition was met
            print("case 3\n")
            testArray.removeFirst()
        }
        defaults.set(testArray, forKey: "Exercises_Left")
    }
    
    @IBAction func nextScreenGesture(_ sender: UILongPressGestureRecognizer) {
        if(exitStatus){
            //show reward screen
            self.performSegue(withIdentifier: "goToHome", sender: self)
        } else {
            self.performSegue(withIdentifier: "backToTraining", sender: self)
        }
    }
}
