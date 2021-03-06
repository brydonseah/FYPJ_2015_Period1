//
//  TeacherSignUpViewController.swift
//  test1
//
//  Created by fypjadmin on 18/5/15.
//  Copyright (c) 2015 nyp. All rights reserved.
//

import UIKit

class TeacherSignUpViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var confirmEmailTextField: UITextField!
    
    var length: Int = 10
    var randomPass: String!
    var ref = Firebase(url: "https://fypjquest2015.firebaseio.com/")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomStringOfLength(length:Int)->String{
        var wantedCharacters:NSString="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789"
        var s=NSMutableString(capacity: length)
        for (var i:Int = 0; i < length; i++) {
            let r:UInt32 = arc4random() % UInt32( wantedCharacters.length)
            let c:UniChar = wantedCharacters.characterAtIndex( Int(r) )
            s.appendFormat("%C", c)
        }
        return s as String
    }
    
    @IBAction func createUser(sender: UIButton){
        
        if (emailTextField.text.isEmpty && confirmEmailTextField.text.isEmpty) {
            
            let alert = UIAlertView()
            alert.title = "No Text"
            alert.message = "Please Enter Text In The Box"
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        }
            
        else if (emailTextField.text != confirmEmailTextField.text) {
            let alert = UIAlertView()
            alert.title = "Different email entered."
            alert.message = "Please check the emails you entered in the fills are the same. "
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        }
            
        else {
            self.randomPass = self.randomStringOfLength(length)
            
            ref.createUser("\(self.confirmEmailTextField.text)", password: "\(randomPass)",
                withValueCompletionBlock: { error, result in
                    if error != nil {
                        // There was an error creating the account
                    } else {
                        let uid = result["uid"] as! String
                        println("Successfully created user account with uid: \(uid)")
                        
                        var refreshAlert = UIAlertController(title: "Successfully created.", message: "Please remember your first time password is \(self.randomPass).", preferredStyle: UIAlertControllerStyle.Alert)
                        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                            self.performSegueWithIdentifier("SaveUser", sender: self)
                        }))
                        
                        self.presentViewController(refreshAlert, animated: true, completion: nil)
                    }
            })
            
        }

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        
        }
   
}
