//
//  NewNote.swift
//  Simple Notes 2
//
//  Created by Anish Laddha on 3/15/18.
//  Copyright © 2018 Anish Laddha. All rights reserved.
//

import UIKit

class NewNote: UIViewController {

    @IBOutlet weak var NewFileName: UITextField!
    
    
    @IBAction func NewGo(_ sender: UIButton) {
        performSegue(withIdentifier: "NewToNote", sender: self)
        
        
    }
    
    
    @IBAction func NewBack(_ sender: UIButton) {
        performSegue(withIdentifier: "NewToStart", sender: self)
    
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NextController = segue.destination as! Note
        NextController.y = NewFileName.text!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
