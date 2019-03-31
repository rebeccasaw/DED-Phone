//
//  ChangeWaitViewController.swift
//  DED Phone
//
//  Created by Rebecca Saw on 31/03/2019.
//  Copyright © 2019 Rebecca Saw. All rights reserved.
//

import UIKit

class ChangeWaitViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    var inputTime = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let current = UserDefaults.standard.integer(forKey: "zeeTime")
        input.text = String(current)
    }
    
    @IBAction func enterPressed(_ sender: Any) {
        inputTime = input.text!
       UserDefaults.standard.set(inputTime,forKey: "zeeTime")
       performSegue(withIdentifier: "diallingSegue", sender: self)
    }
    
  
}
