//
//  V1S1E1ViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 10/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//
public var scorv1s1 = 0

import UIKit

class V1S1E1ViewController: UIViewController , UIPopoverPresentationControllerDelegate {
    

    @IBOutlet weak var textenunt: UITextView!
    @IBOutlet weak var foy: UIButton!
    @IBOutlet weak var toflabel: UILabel!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var NextBtn: UIButton!
    
    func stayout(){
        textenunt.transform = initialdistance
        a.transform = initialdistance
        b.transform = initialdistance
        c.transform = initialdistance
        d.transform = initialdistance
    }
    
    func alpha0(){
    textenunt.alpha = 0
    a.alpha = 0
    b.alpha = 0
    c.alpha = 0
    d.alpha = 0
    }
    
    override func viewDidLoad() {
        scorv1s1 = 0
        //reseteaza scorul
        super.viewDidLoad()
        
        stayout()
        
        alpha0()
       
        NextBtn.isEnabled = false
        NextBtn.isSpringLoaded = true
        a.layer.cornerRadius = 10
        a.isSpringLoaded = true
        b.layer.cornerRadius = 10
        c.layer.cornerRadius = 10
        d.layer.cornerRadius = 10
        foy.layer.cornerRadius = 10
        foy.isEnabled = false
        NextBtn.layer.cornerRadius = 22
        NextBtn.alpha = 0.2
        
        // Do any additional setup after loading the view.
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
    }
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            performSegue(withIdentifier: "yousureaboutdat", sender: self) //cell? sau ceil
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
    
    func animate()
    {
        textenunt.bounces = true
        a.isSpringLoaded = true
        b.isSpringLoaded = true
        c.isSpringLoaded = true
        d.isSpringLoaded = true
        let animator1 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.textenunt.alpha = 1
            self.textenunt.transform = negativeinitialdistance
        })
        animator1.startAnimation()
        let animator2 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            // self.a.alpha = 1
            self.a.transform = negativeinitialdistance
        })
        animator2.startAnimation(afterDelay: 0.15)
        let animator3 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.b.alpha = 1
            self.b.transform = negativeinitialdistance
        })
        animator3.startAnimation(afterDelay: 0.3)
        let animator4 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.c.alpha = 1
            self.c.transform = negativeinitialdistance
        })
        animator4.startAnimation(afterDelay: 0.45)
        let animator5 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.d.alpha = 1
            self.d.transform = negativeinitialdistance
        })
        animator5.startAnimation(afterDelay: 0.6)
        
        
        
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.textenunt.alpha = 1
            //self.textenunt.transform = self.negativeinitialdistance
        })
        animator6.startAnimation()
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.a.alpha = 1
            //self.a.transform = self.negativeinitialdistance
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.b.alpha = 1
            //self.b.transform = self.negativeinitialdistance
        })
        animator8.startAnimation(afterDelay: 0.5)
        let animator9 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.c.alpha = 1
            //self.c.transform = self.negativeinitialdistance
        })
        animator9.startAnimation(afterDelay: 0.75)
        let animator10 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.d.alpha = 1
            //self.d.transform = self.negativeinitialdistance
        })
        animator10.startAnimation(afterDelay: 1)
        
        
        
        
        
    }
    
    func correctanswer()
    {
        
        toflabel.textColor = UIColor.green
        toflabel.text = "Correct!"
        d.backgroundColor = UIColor.green
        c.backgroundColor = UIColor.red
        b.backgroundColor = UIColor.red
        a.backgroundColor = UIColor.red
        NextBtn.backgroundColor = UIColor.green
        NextBtn.isEnabled = true
        NextBtn.alpha = 1
        a.isEnabled = false
        b.isEnabled = false
        c.isEnabled = false
        d.isEnabled = false
        scorv1s1 = scorv1s1 + 1
    }
    
    func falseanswer()
    {
        toflabel.textColor = UIColor.red
        toflabel.text = "False"
        d.backgroundColor = UIColor.green
        c.backgroundColor = UIColor.red
        b.backgroundColor = UIColor.red
        a.backgroundColor = UIColor.red
        a.isEnabled = false
        b.isEnabled = false
        c.isEnabled = false
        d.isEnabled = false
        foy.alpha = 1
        foy.isEnabled = true
        
    }
    
    
    @IBAction func nextpress(_ sender: UIButton) {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            /* self.textenunt.transform = transitiondistance
             self.a.transform = transitiondistance
             self.b.transform = transitiondistance
             self.c.transform = transitiondistance
             self.d.transform = transitiondistance
             self.foy.transform = transitiondistance
             */self.toflabel.transform = transitiondistance
            self.NextBtn.backgroundColor = UIColor.gray
        })
        animator.startAnimation()
        
        let translationdistance = CGAffineTransform(translationX: -500, y: 0)
        let animator1 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.textenunt.alpha = 1
            self.textenunt.transform = translationdistance
        })
        animator1.startAnimation()
        let animator2 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            // self.a.alpha = 1
            self.a.transform = translationdistance
        })
        animator2.startAnimation(afterDelay: 0.15)
        let animator3 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.b.alpha = 1
            self.b.transform = translationdistance
        })
        animator3.startAnimation(afterDelay: 0.3)
        let animator4 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.c.alpha = 1
            self.c.transform = translationdistance
        })
        animator4.startAnimation(afterDelay: 0.45)
        let animator5 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.d.alpha = 1
            self.d.transform = translationdistance
            self.foy.transform = translationdistance
        })
        animator5.startAnimation(afterDelay: 0.6)
        
        
        
        self.NextBtn.isEnabled = false
        self.NextBtn.alpha = 0
    }
    
    
    @IBAction func foypress(_ sender: UIButton) {
        NextBtn.alpha = 1
        NextBtn.isEnabled = true
        NextBtn.backgroundColor = UIColor.green
    }
    @IBAction func dPress(_ sender: UIButton) {
        correctanswer()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
        
    }
    @IBAction func cPress(_ sender: UIButton) {
        falseanswer()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func bPress(_ sender: UIButton) {
        falseanswer()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func aPress(_ sender: UIButton) {
        falseanswer()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
       
    }
    

    
    
    /**/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "why1" {
            let popoverViewController = segue.destination //as! UIViewController /*yourviewcontroller*/
            
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        if segue.identifier == "cls9mini1" {
            let popoverViewController = segue.destination //as! UIViewController /*yourviewcontroller*/
            
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    /**/
    
    
    /*
    class AlwaysPopupSegue : UIStoryboardSegue, UIPopoverPresentationControllerDelegate
    {
        override init(identifier: String?, source: UIViewController, destination: UIViewController)
        {
            super.init(identifier: why1popover, source: source, destination: UIViewController)
            destination.modalPresentationStyle = UIModalPresentationStyle.popover
            destination.popoverPresentationController!.delegate = self
        }
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return UIModalPresentationStyle.none
        }
    }
 */
    
    
    
    

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
