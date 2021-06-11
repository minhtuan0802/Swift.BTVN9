//
//  Part2ViewController.swift
//  Swift.BTVN9
//
//  Created by Ngô Minh Tuấn on 08/06/2021.
//

import UIKit

class Part2ViewController: UIViewController {
    
    let curenrdate = NSDate()
    let calendar = NSCalendar.current
    
    
    var timer : Timer!
    
    

    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var minuteView: UIView!
    @IBOutlet weak var hourView: UIView!
    @IBOutlet weak var ClockImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ClockImage.center = self.view.center
        ClockImage.image = UIImage(named: "clock")
        
        centerView.center = ClockImage.center
        centerView.frame.size = CGSize(width: 20, height: 20)
        centerView.layer.cornerRadius = 10

        
        secondView.frame.size = CGSize(width: 70, height: 2)
        minuteView.frame.size = CGSize(width: 60, height: 3)
        hourView.frame.size = CGSize(width: 50, height: 5)
        
        secondView.center = self.view.center
        minuteView.center = self.view.center
        hourView.center = self.view.center

        func setAnchorPoint(kimView:UIView, point:CGPoint) {
            kimView.layer.anchorPoint = point
        }
        
        func getLocation(kimView:UIView,alpha:CGFloat){
            let r = kimView.bounds.size.height/2
            kimView.layer.cornerRadius = r
            
            setAnchorPoint(kimView: kimView, point: CGPoint(x: 0, y: 0.5))
            kimView.transform = CGAffineTransform(rotationAngle: alpha)
            
        }
        
        func runClock() {
            getLocation(kimView: secondView, alpha: setTimer().hour)
            getLocation(kimView: minuteView, alpha: setTimer().minute)
            getLocation(kimView: hourView, alpha: setTimer().second)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runLoop), userInfo: nil, repeats: true)
        }
        runClock()
        
        func setTimer() -> (second: CGFloat, minute: CGFloat, hour: CGFloat) {
            let hour = calendar.component(.hour, from: curenrdate as Date)
            let minute = calendar.component(.minute, from: curenrdate as Date)
            let second = calendar.component(.second, from: curenrdate as Date)
            let hourInAboutSecond = hour * 60 * 60 + minute * 60 + second
            let minuteInAboutSecond = minute * 60 + second
            
            
            let firstAlphahour = CGFloat.pi*(2*CGFloat(hourInAboutSecond)/12/60/60 - 0.5)
            let firstAlphaminute = CGFloat.pi*(2*CGFloat(minuteInAboutSecond)/60/60 - 0.5)
            let firstAlphasecond = CGFloat.pi*(2*CGFloat(second)/60 - 0.5)
            
            return (firstAlphahour, firstAlphaminute, firstAlphasecond)
        }
    }
    
    @objc func runLoop(){
        let omegaSecond = CGAffineTransform(rotationAngle: CGFloat.pi*2/60)
        let omegaMinute = CGAffineTransform(rotationAngle: CGFloat.pi*2/60/60)
        let omegaHour = CGAffineTransform(rotationAngle: CGFloat.pi*2/60/60/12)
        
        secondView.transform = secondView.transform.concatenating(omegaSecond)
        minuteView.transform = minuteView.transform.concatenating(omegaMinute)
        hourView.transform = hourView.transform.concatenating(omegaHour)

    }
    


}
