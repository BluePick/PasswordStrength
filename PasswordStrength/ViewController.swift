//
//  ViewController.swift
//  PasswordStrength
//
//  Created by Michael Griffin on 2015-11-23.
//  Copyright © 2015 Micheal Griffin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func findPWStrength(sender: UIButton) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowPasswordSegue"
        {
            if let destinationVC = segue.destinationViewController as? BarChartViewController{
                destinationVC.passwordToDisplay = password.text!
           }
        }
    }
}

