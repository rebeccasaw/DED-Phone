//
//  TimerViewController.swift
//  DED Phone
//
//  Created by Rebecca Saw on 30/03/2019.
//  Copyright © 2019 Rebecca Saw. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var timer=Timer()
    var count = 0
    var length = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.everySecond), userInfo: nil, repeats: true)
    }
    
    @objc func everySecond(){
        count += 1
        if(count>=length){
            performSegue(withIdentifier: "callSegue", sender: self)
        }
    }
  

}
