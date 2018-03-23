//
//  OldNote.swift
//  Simple Notes 2
//
//  Created by Anish Laddha on 3/15/18.
//  Copyright © 2018 Anish Laddha. All rights reserved.
//

import UIKit

class OldNote: UIViewController {

    
    @IBOutlet weak var OldFileName: UITextField!
    
    
    
    @IBAction func OldGo(_ sender: UIButton) {
        performSegue(withIdentifier: "OldToNote", sender: self)
        
        
    }
    
    
    
    @IBAction func OldBack(_ sender: UIButton) {
        performSegue(withIdentifier: "OldToStart", sender: self)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NextController2 = segue.destination as! Note
        NextController2.z = OldFileName.text!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
