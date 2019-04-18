//
//  SecondViewController.swift
//  DED Phone
//
//  Created by Rebecca Saw on 30/03/2019.
//  Copyright © 2019 Rebecca Saw. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController,AVAudioPlayerDelegate{

    var ringingPlayer=AVAudioPlayer()
    var zeePlayer=AVAudioPlayer()
   
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var timer=Timer()
    var endCallTimer=Timer()
    
    var seconds = 0
    var minutes = 0
    
    @IBOutlet weak var callingNumber: UITextView!
    
    @IBOutlet weak var statusText: UITextView!
    
    @IBOutlet weak var callingImage: UIImageView!
    
    var incomingNumber = String("")
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callingNumber.text=incomingNumber
      
        let ringingSound = Bundle.main.path(forResource:"Ringing2", ofType:"wav")
        let zeeSound = Bundle.main.path(forResource:"z1", ofType:"wav")

        do {
            ringingPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:ringingSound!)as URL)
            ringingPlayer.delegate = self
            
            zeePlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:zeeSound!)as URL)
            zeePlayer.delegate = self
        }catch {
            print(error)
        }
     
        ringingPlayer.play()
    }

    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
     //   print("finished "+String(player.duration));
     
        if(player.duration<6){
        statusText.text="00:00" //start timer
       timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.everySecond), userInfo: nil, repeats: true)
        callingImage.image = UIImage(named: "called plain")
        zeePlayer.play()
    
        }else{
            timer.invalidate()
            backgroundImage.image = UIImage(named: "call ended")
            statusText.text = "call ended"
            statusText.textColor = UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0)
            callingNumber.textColor = UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0)
   
             endCallTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.returnToDialler), userInfo: nil, repeats: false)
            
            
        }
        
    }

    @objc func everySecond(){
        seconds+=1
        if(seconds>59){
            seconds=0
            minutes+=1
        }
        statusText.text=String(format:"%02d",minutes)+":"+String(format:"%02d",seconds)
    }
    
    @objc func returnToDialler(){
       performSegue(withIdentifier: "diallingSeque", sender: self)
    }
}

