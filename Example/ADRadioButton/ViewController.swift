//
//  ViewController.swift
//  ADRadioButton
//
//  Created by AdityaTripathi613 on 02/16/2021.
//  Copyright (c) 2021 AdityaTripathi613. All rights reserved.
//

import UIKit
import ADRadioButton
class ViewController: UIViewController {

    @IBOutlet weak var btnCheck: ADRadioButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func btnRadioAction(_ sender: ADRadioButton) {
        print("Sender",sender.isChecked)
    }
}

