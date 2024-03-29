//
//  RestScreen.swift
//  UT-Fit-App
//
//  Created by Leon Lee on 2022-11-20.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit
import AVFoundation

class RestScreen: UIViewController {
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    @IBOutlet weak var restBackground: UIImageView!
    
    var exitStatus = false
    
    //Elements needed to draw the timer
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    var timeLeft: TimeInterval = 3                         //number of seconds of rest
    var rounded: Int {return Int(round(timeLeft))}
    var endTime: Date?
    var timeLabel =  UILabel()
    var timer = Timer()
    var timeStringConverter = TimeStringGetter()
    
    //Makes sure events only happen once
    var tapCount = 0
    var holdCount = 0
    var exerciseSkipped = false
    
    //Elements for current exercise Session
    let defaults = UserDefaults.standard
    let SessionCreator = Session()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets GIF background
        let theURL = Bundle.main.url(forResource:"gif", withExtension: "mp4")
        
        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = .resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
        
        //Creates timer
        drawBgShape()
        drawTimeLeftShape()
        addTimeLabel()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RestScreen.startTimer))
        view.addGestureRecognizer(tap)
        
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(RestScreen.skipRest))
        view.addGestureRecognizer(longTap)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: .zero)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
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
    
    //Defines what happens if the user skips the rest
    @objc func skipRest(){
        if(holdCount == 0){
            print("held detected")
            exerciseSkipped = true
            
            //Allows users to finish the set early before the timer ends
            endTimerAction()
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
        if timeLeft > 0 {                                           //When timer is still active
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeStringConverter.getString(timeData: rounded)
        } else {                                                    //What happens once timer
            endTimerAction()
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
        timeLeftShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius: 150, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
            let timerColor = UIColor(hex: "#2cebe0ff")!
            timeLeftShapeLayer.strokeColor = timerColor.cgColor
            timeLeftShapeLayer.fillColor = UIColor.clear.cgColor
            timeLeftShapeLayer.lineWidth = 15
            timeLeftShapeLayer.lineCap = CAShapeLayerLineCap.round
            view.layer.addSublayer(timeLeftShapeLayer)
        }
    
    //Defines what happens when the timer ends
    func endTimerAction(){
        timeLabel.text = "00:00"
        timer.invalidate()
    
        var testArray = defaults.object(forKey:"Exercises_Left") as? [Int] ?? [Int]()
        //Decrements number of exercises left
        
        if(testArray.isEmpty){
            print("case 1\n")
            /*
            Execute workout finish logic
            1. updates current workout to Firebase
            2. update user default to next workout
            3. return to home page
            4. ping pong is great
             
            OLD NOTES:
            //Prepares next workout session
            //SessionCreator.loadWorkoutSession()
            //Sets exitStatus to true so it goes back to home screen
             */
            exitStatus = true
        } else if(testArray[0] != 0){
            print("case 2\n")
            testArray[0] -= 1
            defaults.set(testArray, forKey: "Exercises_Left")
        } else if(testArray[0] == 0){
            //code to finish workout because necessary condition was met
            print("case 3\n")
            testArray.removeFirst()
            defaults.set(testArray, forKey: "Exercises_Left")
        }
            
        if(exitStatus){
            //show reward screen then goes back to home screen
            self.performSegue(withIdentifier: "goToHome", sender: self)
        } else {
            self.performSegue(withIdentifier: "backToTraining", sender: self)
        }
    }
}


