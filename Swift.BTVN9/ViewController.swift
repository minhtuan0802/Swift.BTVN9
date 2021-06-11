//
//  ViewController.swift
//  Swift.BTVN9
//
//  Created by Ngô Minh Tuấn on 08/06/2021.
//

import UIKit

enum Time {
    case Start
    case Pause
}

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    var timer : Timer!
    var hourCount = 0
    var minuteCount = 0
    var secondCount = 0
    var timeType : Time = .Start
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func startButton(_ sender: Any) {
        if timeType == Time.Start {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runStart), userInfo: nil, repeats: true)
            myButton.setTitle("PAUSE", for: .normal)
            timeType = Time.Pause
        } else {
            myButton.setTitle("START", for: .normal)
            timeType = Time.Start
            timer.invalidate()
        }
    }
    @objc func runStart() {
        secondCount += 1
        if secondCount == 60 {
            minuteCount += 1
            secondCount = 0
            if minuteCount == 60 {
                hourCount += 1
                minuteCount = 0
            }
        }

        myLabel.text = String(format: "%02d:%02d:%02d", hourCount, minuteCount, secondCount)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        myButton.setTitle("START", for: .normal)
        timeType = Time.Start
        hourCount = 0
        minuteCount = 0
        secondCount = 0
        myLabel.text = String(format: "%02d:%02d:%02d", hourCount, minuteCount, secondCount)
    }
}

