//
//  Part3ViewController.swift
//  Swift.BTVN9
//
//  Created by Ngô Minh Tuấn on 09/06/2021.
//

import UIKit

class Part3ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius = 50
        myView.center.x = self.view.center.x
        
        UIView.animate(withDuration: 5){
            self.myView.frame.origin.y = CGFloat(self.view.frame.size.height - self.myView.frame.size.height)
        }
    }
    
}
