//
//  var1sub1READYViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 10/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class var1sub1READYViewController: UIViewController {

    @IBOutlet weak var sub1title: UILabel!
    @IBOutlet weak var var1title: UILabel!
    @IBOutlet weak var effectview: UIVisualEffectView!
    @IBOutlet weak var gobtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var1title.shadowOffset = CGSize(width: -1, height: 1)
        var1title.shadowColor = UIColor.black
        var1title.layer.masksToBounds = false
        var1title.layer.shadowRadius = 3
        var1title.layer.shadowOpacity = 0.7
        var1title.layer.shouldRasterize = true
        
        sub1title.shadowOffset = CGSize(width: -1, height: 1)
        sub1title.shadowColor = UIColor.black
        sub1title.layer.masksToBounds = false
        sub1title.layer.shadowRadius = 3
        sub1title.layer.shadowOpacity = 0.7
        sub1title.layer.shouldRasterize = true
        
        self.effectview.effect = nil
        gobtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            performSegue(withIdentifier: "back2mainmenu", sender: self)
        }
    }
    
    
    func blurbg()
    {
        UIView.animate(withDuration: 0.5) {
            self.effectview.effect = UIBlurEffect(style: .dark)
        }
    }
    func animateout()
    {
        let goout = CGAffineTransform(translationX: -500, y: 0)
        UIView.animate(withDuration: 0.3, animations: {
            self.var1title.transform = goout
            self.sub1title.transform = goout
            self.gobtn.transform = goout
        })
    }
    @IBAction func gopress(_ sender: UIButton) {
        blurbg()
        animateout()
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
