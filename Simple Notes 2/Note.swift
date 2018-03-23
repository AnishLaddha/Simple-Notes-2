//
//  Note.swift
//  Simple Notes 2
//
//  Created by Anish Laddha on 3/15/18.
//  Copyright © 2018 Anish Laddha. All rights reserved.
//
//////////KEY  IS SAME, JUST FIND THE POSITION OF ONE AND GET THE OTHER
import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext
let newFile = NSEntityDescription.insertNewObject(forEntityName: "FileData", into: context)
let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FileData")

class Note: UIViewController {

    

    var y = ""
    var z = ""
    @IBOutlet weak var UsrNote: UITextView!
    
    @IBAction func SaveNote(_ sender: UIButton) {
        
        if check(a: y, b: z) == true{
            newFile.setValue(z, forKey: "fileName")
            do {
                try context.save()
                print(z)
                print("Save successful!!!")
            }
            catch{
                print("Error at save")
            }
        }
        else{


            newFile.setValue(y, forKey: "fileName")
            do {
                try context.save()
                print("Save successful!!!")
            }
            catch{
                print("error at save")
            }
        }
        
        if check(a: y, b: z) == true{
            let fileSetter2 = String(UsrNote.text!) + "CONTAINS" + z
            newFile.setValue(fileSetter2, forKey: "fileContent")
            
            do {
                try context.save()
                print(z)
                print("Save successful!!!")
            }
            catch{
                print("Error at save")
            }
        }
        else{
            
            let fileSetter2 = String(UsrNote.text!)
            newFile.setValue(fileSetter2, forKey: "fileContent")
            do {
                try context.save()
                print("Save successful!!!")
            }
            catch{
                print("error at save")
            }
        }
    }
    
    @IBAction func FinalBack(_ sender: UIButton) {
        performSegue(withIdentifier: "NoteToStart", sender: self)
        
        
    }
    func isAnInt(string: String) -> Bool {
        if let _ = Int(string) {
            return true
        }
        return false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if noteContent() == "hello, start typing."{
            UsrNote.text = noteContent()
        }
        else if noteContent() == "error"{
            print("error at notecheck")
        }
        else if isAnInt(string: noteContent()) == true{
            let finalI = Int(noteContent())
            request.returnsObjectsAsFaults = false
            do{
                let finalresults = try context.fetch(request)
                let push = finalresults[finalI!]
                let push2 = push as! NSManagedObject
                let push3 = push2.value(forKey: "fileContent")
                UsrNote.text = push3 as! String
            }
            catch{
                print("error")
            }
        }
        else{
            UsrNote.text = "Something went wrong..."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func anishvalue() -> String {
        if check(a: z, b: y) == true{
            return z
        }
        else{
            return y
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func check(a: String, b: String) -> Bool {
        if a == ""{
            return true
        }
        else {
            return false
        }
    }
    func noteContent() -> String{
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if results.count > 0{
                var i=0
                
                for result in results as! [NSManagedObject]{
                    let abc = result.value(forKey: "fileName") as! String
                    if abc == anishvalue(){
                        return String(i)
                        
                    }
                    i = i+1
                    
                }
                return "hello, start typing"
            }
            else{
                
                return "hello, start typing."
            }
        }
        catch{
            print("error at view did load")
            return "error"
        }
        
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
