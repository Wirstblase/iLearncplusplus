//
//  yousure?ViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 10/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class yousure_ViewController: UIViewController {

    @IBOutlet weak var textviewout: UIView!
    @IBOutlet weak var nobut: UIButton!
    @IBOutlet weak var yesbut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        textviewout.layer.cornerRadius = 10
        nobut.layer.cornerRadius = 10
        yesbut.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopup(_ sender: UIButton) {
        dismiss(animated:true, completion: nil)
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
