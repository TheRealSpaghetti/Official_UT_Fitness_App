//
//  RestScreen.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit

class RestScreen: UIViewController {
    
    @IBOutlet weak var restBackground: UIImageView!
    
    var exitStatus = false
    
    //Elements needed to draw the timer
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    var timeLeft: TimeInterval = 30                         //number of seconds of rest
    var rounded: Int {return Int(round(timeLeft))}
    var endTime: Date?
    var timeLabel =  UILabel()
    var timer = Timer()
    var timeStringConverter = TimeStringGetter()
    
    //Makes sure events only happen once
    var tapCount = 0
    var holdCount = 0
    var exerciseSkipped = false

    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets GIF background
        let backGroundGif = UIImage.gifImageWithName("background_gif")
        restBackground.image = backGroundGif
        
        //Creates timer
        drawBgShape()
        drawTimeLeftShape()
        addTimeLabel()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RestScreen.startTimer))
        view.addGestureRecognizer(tap)
        
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(RestScreen.skipRest))
        view.addGestureRecognizer(longTap)
    }
    
    @objc func startTimer(){
        if(tapCount == 0){
            // Here you define the fromValue, toValue and duration of your animation
            strokeIt.fromValue = 1
            strokeIt.toValue = -0.0001
            strokeIt.duration = timeLeft
            strokeIt.fillMode = CAMediaTimingFillMode.forwards
            strokeIt.isRemovedOnCompletion = false
            
            //Add the animation to your timeLeftShapeLayer
            timeLeftShapeLayer.add(strokeIt, forKey: nil)
            
            //Define the future end time by adding the timeLeft to now Date()
            endTime = Date().addingTimeInterval(timeLeft)
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            tapCount+=1
        }
    }
    
    @objc func skipRest(){
        if(holdCount == 0){
            print("held detected")
            exerciseSkipped = true
            //Allows users to finish the set early before the timer ends
            if(exitStatus){
                self.performSegue(withIdentifier: "goToHome", sender: self)
            } else {
                self.performSegue(withIdentifier: "backToTraining", sender: self)
            }
            holdCount += 1
        }
    }

    func drawBgShape() {
        //Creates the basic animation object to animate the strokeEnd
        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
            150, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor.darkGray.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 15
        view.layer.addSublayer(bgShapeLayer)
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeStringConverter.getString(timeData: rounded)
        } else {
            timeLabel.text = "00:00"
            timer.invalidate()

            if(exerciseSkipped == false){
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
                
                if(exitStatus){
                    //show reward screen
                    self.performSegue(withIdentifier: "goToHome", sender: self)
                } else {
                    self.performSegue(withIdentifier: "backToTraining", sender: self)
                }
            }
        }
    }
    
    func addTimeLabel() {
        timeLabel = UILabel(frame: CGRect(x: view.frame.midX-50 ,y: view.frame.midY-25, width: 100, height: 50))
        timeLabel.textAlignment = .center
        timeLabel.text = timeStringConverter.getString(timeData: rounded)
        timeLabel.textColor = UIColor.white
        timeLabel.font = timeLabel.font.withSize(35)
        view.addSubview(timeLabel)
    }
    
    func drawTimeLeftShape() {
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
            150, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        let timerColor = UIColor(hex: "#2cebe0ff")!
        timeLeftShapeLayer.strokeColor = timerColor.cgColor
        timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
        timeLeftShapeLayer.lineWidth = 15
        timeLeftShapeLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(timeLeftShapeLayer)
    }
}
