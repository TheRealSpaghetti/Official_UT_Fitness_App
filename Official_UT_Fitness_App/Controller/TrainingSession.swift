//
//  TrainingSession.swift
//  Training Scene
//
//  Created by Leon Lee on 2022-11-15.
//  Copyright © 2022 Leon Lee. All rights reserved.
//

import UIKit
import Firebase

class TrainingSession: UIViewController {
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var backgroundGif: UIImageView!
    let db = Firestore.firestore()
    let timeLeftShapeLayer = CAShapeLayer()
    let bgShapeLayer = CAShapeLayer()
    var timeLeft: TimeInterval = 69
    var rounded: Int {return Int(round(timeLeft))}
    var endTime: Date?
    var timeLabel =  UILabel()
    var timer = Timer()
    var timeStringConverter = TimeStringGetter()
    var tapCount = 0
    var word = "this has not been changed"
    
    override func viewDidLoad() {
        //sets GIF background
        let squareGif = UIImage.gifImageWithName("fasterbackground")
        let userEmail = String(Auth.auth().currentUser!.email ?? "no email")
        backgroundGif.image = squareGif
        backgroundGif.image = squareGif
        
        let appStatus = UserDefaults.standard.string(forKey: "App Status")
        print(appStatus as Any)
        
        db.collection("Current Workout")
            .whereField("email", isEqualTo: userEmail)
            .order(by: "date", descending: true)
            .limit(to: 1)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for doc in querySnapshot!.documents {
                        let data = doc.data()
                        
                        DispatchQueue.main.async { [self] in
                            print(data["workout type"]!)

                            exerciseLabel.text = "Ooga Booga"
                        }
                    }
                }
        }
        
        print("x")
        super.viewDidLoad()
        tapCount = 0
        drawBgShape()
        drawTimeLeftShape()
        addTimeLabel()
    }

    @IBAction func exerciseStarted(_ sender: UITapGestureRecognizer) {
        if(tapCount == 0){
            // here you define the fromValue, toValue and duration of your animation
            strokeIt.fromValue = 1
            strokeIt.toValue = -0.0001
            strokeIt.duration = timeLeft
            strokeIt.fillMode = CAMediaTimingFillMode.forwards
            strokeIt.isRemovedOnCompletion = false
            // add the animation to your timeLeftShapeLayer
            timeLeftShapeLayer.add(strokeIt, forKey: nil)
            // define the future end time by adding the timeLeft to now Date()
            endTime = Date().addingTimeInterval(timeLeft)
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            tapCount+=1
        }
    }
    
    // here you create your basic animation object to animate the strokeEnd
    let strokeIt = CABasicAnimation(keyPath: "strokeEnd")
    
    func drawBgShape() {
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
            self.performSegue(withIdentifier: "goToRestScreen", sender: self)
        }
    }
    
    @IBAction func endEarly(_ sender: UILongPressGestureRecognizer) {
        
        self.performSegue(withIdentifier: "goToRestScreen", sender: self)
    }
    
}
    
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
