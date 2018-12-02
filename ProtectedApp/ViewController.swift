//
//  ViewController.swift
//  ProtectedApp
//
//  Created by Usman Nisar on 12/1/18.
//  Copyright © 2018 HappyCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstOptionIcon : UIImageView!
    @IBOutlet var secondOptionIcon : UIImageView!
    @IBOutlet var thirdOptionIcon : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onValueChange(_ sender: Any) {
        
        if let valueChangedFor = sender as? UIButton
        {
            selectedOption = valueChangedFor.tag
            
            if selectedOption == 1
            {
                firstOptionIcon.image = #imageLiteral(resourceName: "radiobtn_on")
                secondOptionIcon.image = #imageLiteral(resourceName: "radiobtn_off")
                thirdOptionIcon.image = #imageLiteral(resourceName: "radiobtn_off")
            }
            else if selectedOption == 2
            {
                firstOptionIcon.image = #imageLiteral(resourceName: "radiobtn_off")
                secondOptionIcon.image = #imageLiteral(resourceName: "radiobtn_on")
                thirdOptionIcon.image = #imageLiteral(resourceName: "radiobtn_off")
            }
            else
            {
                firstOptionIcon.image = #imageLiteral(resourceName: "radiobtn_off")
                secondOptionIcon.image = #imageLiteral(resourceName: "radiobtn_off")
                thirdOptionIcon.image = #imageLiteral(resourceName: "radiobtn_on")
            }
        }
    }
}

