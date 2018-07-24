//
//  MainMenuScreenViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/23/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit
import Hero

class MainMenuScreenViewController: UIViewController {
    @IBOutlet weak var onlineimageview: UIImageView!
    @IBOutlet weak var aflabtn: UIButton!
    @IBOutlet weak var invatabtn: UIButton!
    @IBOutlet weak var invataimageview: UIImageView!
    @IBOutlet weak var exerseazalbl: UILabel!
    @IBOutlet weak var aflalbl: UILabel!
    @IBOutlet weak var invatalbl: UILabel!
    @IBOutlet weak var exerseazaimageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hero.isEnabled = true
        aflalbl.hero.id = "butn1"
        onlineimageview.hero.id = "Waves"
        invataimageview.hero.id = "Leaves"
        invatalbl.hero.id = "bUtn"
        exerseazalbl.hero.id = "pinklbl"
        exerseazaimageview.hero.id = "pinkpic"
        //self.hero.modalAnimationType = .selectBy(presenting:.zoom, dismissing:.zoomOut)
        

        // Do any additional setup after loading the view.
    }
    @IBAction func wavesbtnpress(_ sender: Any) {
        let wavesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! socialWelcomeViewController
        wavesVC.hero.isEnabled = true
        wavesVC.hero.modalAnimationType = .zoom
        self.hero.replaceViewController(with: wavesVC)
    }
    
    @IBAction func leavesbtnpress(_ sender: Any) {
        let leavesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC3") as! TeorieViewController
        leavesVC.hero.isEnabled = true
        leavesVC.hero.modalAnimationType = .zoom
        hero.replaceViewController(with: leavesVC)
    }
    
    @IBAction func pinkbtnpress(_ sender: Any) {
        let pinkVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC4") as! SubiecteViewController
        pinkVC.hero.isEnabled = true
        pinkVC.hero.modalAnimationType = .zoom
        hero.replaceViewController(with: pinkVC)
        
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
