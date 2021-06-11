//
//  Part4ViewController.swift
//  Swift.BTVN9
//
//  Created by Ngô Minh Tuấn on 09/06/2021.
//

import UIKit

class Part4ViewController: UIViewController {
    var timer: Timer!
    var count = 0
    var heigh: CGFloat!
    
    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        heigh = myView.frame.origin.y
        print(heigh)
        myView.layer.cornerRadius = 50
        myView.center.x = self.view.center.x
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        
//        UIView.animate(withDuration: 3){
//            self.myView.frame.origin.y = CGFloat(self.view.frame.size.height - self.myView.frame.size.height)
//        }
//        UIView.animate(withDuration: 3){
//            self.myView.frame.origin.y = CGFloat(500)
//        }
        func aa(){
            if self.myView.frame.origin.y == self.view.frame.size.height - self.myView.frame.size.height {
                count += 1
                self.myView.frame.origin.y = heigh
                print(heigh)
            }
        }
        aa()
    }
    
    @objc func runTimer() {
        self.myView.frame.origin.y = CGFloat(self.view.frame.size.height - self.myView.frame.size.height)

    }
    
//    func aa() {
//        if self.myView.frame.origin.y ==  self.view.frame.size.height - self.myView.frame.size.height {
//            self.myView.frame.origin.y = 500
//        }
//    }
    
}
