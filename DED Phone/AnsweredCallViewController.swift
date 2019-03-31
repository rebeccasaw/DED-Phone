//
//  AnsweredCallViewController.swift
//  DED Phone
//
//  Created by Rebecca Saw on 31/03/2019.
//  Copyright © 2019 Rebecca Saw. All rights reserved.
//

import UIKit
import AVFoundation

class AnsweredCallViewController: UIViewController,AVAudioPlayerDelegate {
    var zee2Player=AVAudioPlayer()
    
    var timer=Timer()
    var seconds = 0
    var minutes = 0

    @IBOutlet weak var statusText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let zee2Sound = Bundle.main.path(forResource:"Fire", ofType:"wav")
       
        do {
            zee2Player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:zee2Sound!)as URL)
            zee2Player.delegate = self
        }catch {
            print(error)
        }
        zee2Player.play()
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.everySecond), userInfo: nil, repeats: true)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        performSegue(withIdentifier: "diallingSegue", sender: self)
        
    }

    @objc func everySecond(){
        seconds+=1
        if(seconds>59){
            seconds=0
            minutes+=1
        }
        statusText.text=String(format:"%02d",minutes)+":"+String(format:"%02d",seconds)
    }
}
