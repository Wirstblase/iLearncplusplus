//
//  Cls10OutsideViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 25/04/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class Cls10OutsideViewController: UIViewController {

    //@IBOutlet weak var debuglabel: UILabel!
    @IBOutlet weak var Enter2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Enter2.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
       // debuglabel.text = "\(globalFrameNumber)"
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
