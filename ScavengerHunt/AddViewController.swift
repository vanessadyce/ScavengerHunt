//
//  AddViewController.swift
//  ScavengerHunt
//
//  Created by Vanessa Dyce on 7/29/15.
//  Copyright (c) 2015 Vanessa Dyce. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var newItem : ScavengerHuntItem?
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true,
            completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    newItem = ScavengerHuntItem(name: name)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

