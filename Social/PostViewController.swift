//
//  PostViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/23/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func backbtnpress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = globalcontinut

        // Do any additional setup after loading the view.
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
