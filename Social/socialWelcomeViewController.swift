//
//  socialWelcomeViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/22/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import Hero

class socialWelcomeViewController: UIViewController {
    @IBOutlet weak var enterbtnbg: UIView!
    @IBOutlet weak var welcomebacktext: UILabel!
    @IBOutlet weak var bgimg: UIImageView!
    @IBOutlet weak var enterbtn: UIButton!
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var icppontitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        bgimg.hero.id = "Waves"
        icppontitle.hero.id = "butn1"
        
        if let user = Auth.auth().currentUser {
            let numeuser = Auth.auth().currentUser?.displayName
            welcomebacktext.text = "Welcome back, \(numeuser!)"
        } else {welcomebacktext.text = "Not logged in"}
        
        enterbtnbg.layer.cornerRadius = 25

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterPress(_ sender: Any) {
        
        
        if let user = Auth.auth().currentUser {
            performSegue(withIdentifier: "enter", sender: self)
        } else {
            performSegue(withIdentifier: "loadlogin", sender: self)
        }
    }
    
    @IBAction func goback(_ sender: Any) {
    
        hero.isEnabled = true
        
        let VC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC1") as! MainMenuScreenViewController
        
        VC1.hero.modalAnimationType = .selectBy(presenting: .auto, dismissing: .auto)
        
        hero.replaceViewController(with: VC1)
        
        //hero.unwindToRootViewController()
        
    }
    
    @IBAction func logoutpress(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        if(comingfromloginorsignup)
        {
            comingfromloginorsignup = false
            performSegue(withIdentifier: "enter", sender: self)
        }
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
