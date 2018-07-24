//
//  VarianteOutsideViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 09/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class VarianteOutsideViewController: UIViewController {
    @IBOutlet weak var PDFCatalog: UIButton!
    @IBOutlet weak var sub1: UIButton!
    @IBOutlet weak var sub2: UIButton!
    @IBOutlet weak var sub3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sub1.layer.cornerRadius = 10
        sub2.layer.cornerRadius = 10
        sub3.layer.cornerRadius = 10
        PDFCatalog.layer.cornerRadius = 10
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        // Do any additional setup after loading the view.
    }
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            performSegue(withIdentifier: "exit7", sender: self) //cell? sau ceil
        }
        
        // Do any additional setup after loading the view, typically from a nib.
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
