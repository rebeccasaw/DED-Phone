//
//  ViewController.swift
//  DED Phone
//
//  Created by Rebecca Saw on 28/03/2019.
//  Copyright © 2019 Rebecca Saw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UITextView!
    
    @IBOutlet weak var callingNumber: UITextView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        number.text=""
    }

    @IBAction func press1(_ sender: Any) {
        //print("button press = ",sender.self)
        number.text=number.text+"1"
    }
    
    @IBAction func press2(_ sender: Any) {
        number.text=number.text+"2"
    }
    
    @IBAction func press3(_ sender: Any) {
        number.text=number.text+"3"
    }
    
    @IBAction func press4(_ sender: Any) {
        number.text=number.text+"4"
    }
    
    @IBAction func press5(_ sender: Any) {
        number.text=number.text+"5"
    }
    
    @IBAction func press6(_ sender: Any) {
        number.text=number.text+"6"
    }
    
    @IBAction func press7(_ sender: Any) {
        number.text=number.text+"7"
    }
    
    @IBAction func press8(_ sender: Any) {
        number.text=number.text+"8"
    }
    
    @IBAction func press9(_ sender: Any) {
        number.text=number.text+"9"
    }
    
    @IBAction func press0(_ sender: Any) {
        number.text=number.text+"0"
    }
    
    @IBAction func pressStar(_ sender: Any) {
        number.text=number.text+"*"
    }
    @IBAction func pressHash(_ sender: Any) {
        number.text=number.text+"#"
    }
    
    @IBAction func phone(_ sender: Any) {
       // print("phone "+number.text)
        if(number.text=="*"){
             performSegue(withIdentifier: "timerSegue", sender: self)
        }else if(number.text == "745683662"){
         performSegue(withIdentifier: "changeWaitSegue", sender: self)
        }
        else if(!number.text.isEmpty){
        performSegue(withIdentifier: "callingSeque", sender: self)
        }
        
    }
    @IBAction func backPress(_ sender: Any) {
        number.text = String(number.text.dropLast())
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "callingSeque"){
        let secondController = segue.destination as! SecondViewController
        secondController.incomingNumber = number.text
      }
    }
}

