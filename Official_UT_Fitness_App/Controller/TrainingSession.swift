//
//  TrainingSession.swift
//  Training Scene
//
//  Created by Leon Lee on 2022-11-15.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class TrainingSession: UIViewController {
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    //Displayed on the UI
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var backgroundGif: UIImageView!
    
    //Elements needed to fetch data & update the UI
    let db = Firestore.firestore()
    let defaults = UserDefaults.standard
    
    //Elements needed to draw the timer
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    var timeLeft: TimeInterval = 12                        //number of seconds on the timer
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
        
        //Uses UserDefaults to make the array that stores the data for the current exercise
        /*
         Exercise Array looks like ["Name", "Time to do exercise", "Rest time", "sets", "reps"]
         */
        
        let infoToLoad = defaults.object(forKey:"Current_Exercise_Info") as? [String] ?? [String]()
        
        //Initializes time to do exercise on the timer
        //timeLeft = Double(infoToLoad[1])!
        
        print(infoToLoad)
        //exerciseLabel.font = UIFont(name: "Intro Rust", size: 20)
        
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
        
        //Fetches data from Firebase to display current exercise information
        let testArray = defaults.object(forKey:"Exercises_Left") as? [Int] ?? [Int]()
        print("Train Screen \(testArray)")
        
        //Prints current exercise name
        exerciseLabel.text = "VERY LONG TEXT HERE BLAH BLAH BLAH"
        print(infoToLoad)
        
        //Creates timer
        drawBgShape()
        drawTimeLeftShape()
        addTimeLabel()
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

    @IBAction func exerciseStarted(_ sender: UITapGestureRecognizer) {
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
    
    func drawBgShape() {
        //Creates the basic animation object to animate the strokeEnd
        bgShapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX , y: view.frame.midY), radius:
            150, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        bgShapeLayer.strokeColor = UIColor.darkGray.cgColor
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.lineWidth = 15
        view.layer.addSublayer(bgShapeLayer)
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
    
    func addTimeLabel() {
        timeLabel = UILabel(frame: CGRect(x: view.frame.midX-50 ,y: view.frame.midY-25, width: 100, height: 50))
        timeLabel.textAlignment = .center
        timeLabel.text = timeStringConverter.getString(timeData: rounded)
        timeLabel.textColor = UIColor.white
        timeLabel.font = timeLabel.font.withSize(35)
        view.addSubview(timeLabel)
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timeLabel.text = timeStringConverter.getString(timeData: rounded)
        } else {
            timeLabel.text = "00:00"
            timer.invalidate()

            if(exerciseSkipped == false){
                self.performSegue(withIdentifier: "goToRestScreen", sender: self)
            }
        }
    }
    
    @IBAction func endEarly(_ sender: UILongPressGestureRecognizer) {
        if(holdCount == 0){
            print("held detected")
            exerciseSkipped = true
            //Allows users to finish the set early before the timer ends
            self.performSegue(withIdentifier: "goToRestScreen", sender: self)
            holdCount += 1
        }
    }
}

//Extensions for formatting the UI
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
