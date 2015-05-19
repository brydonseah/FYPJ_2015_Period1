//
//  TeacherLoginViewController.swift
//  test1
//
//  Created by fypjadmin on 18/5/15.
//  Copyright (c) 2015 nyp. All rights reserved.
//

import UIKit

class TeacherLoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    
    var firstPass: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveSignUp(segue: UIStoryboardSegue){
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
