//
//  ViewController.swift
//  Simple Notes 2
//
//  Created by Anish Laddha on 3/15/18.
//  Copyright © 2018 Anish Laddha. All rights reserved.
//  Attempt 2, this time with Core Data and not global variables
//  *sigh*
import UIKit

class ViewController: UIViewController {

    
    @IBAction func NewFile(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToNew", sender: self)
    }
    
    
    @IBAction func OldButton(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToOld", sender: self)
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

