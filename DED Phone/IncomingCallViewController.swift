//
//  IncomingCallViewController.swift
//  DED Phone
//
//  Created by Rebecca Saw on 31/03/2019.
//  Copyright © 2019 Rebecca Saw. All rights reserved.
//

import UIKit
import AVFoundation

class IncomingCallViewController: UIViewController {
    var ringPlayer=AVAudioPlayer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isIdleTimerDisabled = true
        
        let ringSound = Bundle.main.path(forResource:"RingRing", ofType:"wav")
        
        do {
            ringPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:ringSound!)as URL)
        }catch {
            print(error)
        }
        ringPlayer.numberOfLoops = -1
        ringPlayer.play()
    }
    
    @IBAction func answerCall(_ sender: Any) {
        ringPlayer.stop()
        performSegue(withIdentifier: "pickupSegue", sender: self)
    }
    
 

}
