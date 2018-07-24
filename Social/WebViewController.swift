//
//  WebViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/20/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase

var comingfromloginorsignup = false

class WebViewController: UIViewController {
    @IBOutlet weak var loginbutbg: UIView!
    
    @IBOutlet weak var signupbutbg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginbutbg.layer.cornerRadius = 25
        signupbutbg.layer.cornerRadius = 25
       
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
