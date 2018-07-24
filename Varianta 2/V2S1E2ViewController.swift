//
//  V2S1E2ViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 23/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class V2S1E2ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var aparanteza: UITextView!
    @IBOutlet weak var enunt1: UITextView!
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var btextview: UITextView!
    @IBOutlet weak var NextBtn: UIButton!
    @IBOutlet weak var why3: UIButton!
    @IBOutlet weak var d2: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var why2: UIButton!
    @IBOutlet weak var d1: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var a1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialposition()
        //muta tot inafara ecranului pentru a face posibila animatia de load
        
        a1.layer.cornerRadius = 10
        b1.layer.cornerRadius = 10
        c1.layer.cornerRadius = 10
        d1.layer.cornerRadius = 10
        a2.layer.cornerRadius = 10
        b2.layer.cornerRadius = 10
        c2.layer.cornerRadius = 10
        d2.layer.cornerRadius = 10
        why2.layer.cornerRadius = 10
        why3.layer.cornerRadius = 10
        NextBtn.layer.cornerRadius = 22
        NextBtn.alpha = 0.2
        
        //butoanele "afla de ce" sunt ascunse si disabled
        why2.alpha = 0
        why2.isEnabled = false
        why3.alpha = 0
        why3.isEnabled = false
        //
        
        //punctul b e disabled
        btextview.alpha = 0.2
        a2.alpha = 0.2
        b2.alpha = 0.2
        c2.alpha = 0.2
        d2.alpha = 0.2
        a2.isEnabled = false
        b2.isEnabled = false
        c2.isEnabled = false
        d2.isEnabled = false
        //
        unuishidden()
        //face partea 1 sa fie ascunsa si disabled
        // Do any additional setup after loading the view.let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            performSegue(withIdentifier: "areyasure2", sender: self)
        }
    }
    
        
    func unuishidden()
    {
        enunt1.alpha = 0.2
        imgview.alpha=0.2
        a1.alpha = 0.2
        b1.alpha = 0.2
        c1.alpha = 0.2
        d1.alpha = 0.2
        aparanteza.alpha = 0.2
    }
    
    func initialposition()
    {
        enunt1.transform = initialdistance
        imgview.transform = initialdistance
        aparanteza.transform = initialdistance
        a1.transform = initialdistance
        b1.transform = initialdistance
        c1.transform = initialdistance
        d1.transform = initialdistance
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadpt1()
    }
    
    func loadpt1()
    {
        /*let animator1 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.enunt1.alpha = 1
        })
        animator1.startAnimation()
        let animator2 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.imgview.alpha = 1
        })
        animator2.startAnimation(afterDelay: 0.25)
        let animator3 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.aparanteza.alpha = 1
        })
        animator3.startAnimation(afterDelay: 0.5)
        let animator4 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a1.alpha = 1
        })
        animator4.startAnimation(afterDelay: 0.75)
        let animator5 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b1.alpha = 1
        })
        animator5.startAnimation(afterDelay: 1)
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c1.alpha = 1
        })
        animator6.startAnimation(afterDelay: 1.25)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d1.alpha = 1
        })
        animator7.startAnimation(afterDelay: 1.5)
        */
        //enunt1 , imgview, aparanteza
        let animator22 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.enunt1.transform = negativeinitialdistance
        })
        animator22.startAnimation()
        let animator11 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.imgview.transform = negativeinitialdistance
        })
        animator11.startAnimation(afterDelay: 0.15)
        let animator1 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.aparanteza.transform = negativeinitialdistance
        })
        animator1.startAnimation(afterDelay: 0.3)
        let animator2 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            // self.a.alpha = 1
            self.a1.transform = negativeinitialdistance
        })
        animator2.startAnimation(afterDelay: 0.45)
        let animator3 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.b.alpha = 1
            self.b1.transform = negativeinitialdistance
        })
        animator3.startAnimation(afterDelay: 0.6)
        let animator4 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.c.alpha = 1
            self.c1.transform = negativeinitialdistance
        })
        animator4.startAnimation(afterDelay: 0.75)
        let animator5 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.d.alpha = 1
            self.d1.transform = negativeinitialdistance
        })
        animator5.startAnimation(afterDelay: 0.9)
        
        
        
        let animator33 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.enunt1.alpha = 1
        })
        animator33.startAnimation()
        let animator44 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.imgview.alpha = 1
        })
        animator44.startAnimation(afterDelay: 0.25)
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.aparanteza.alpha = 1
            //self.textenunt.transform = self.negativeinitialdistance
        })
        animator6.startAnimation(afterDelay: 0.5)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.a1.alpha = 1
            //self.a.transform = self.negativeinitialdistance
        })
        animator7.startAnimation(afterDelay: 0.75)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.b1.alpha = 1
            //self.b.transform = self.negativeinitialdistance
        })
        animator8.startAnimation(afterDelay: 1)
        let animator9 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.c1.alpha = 1
            //self.c.transform = self.negativeinitialdistance
        })
        animator9.startAnimation(afterDelay: 1.25)
        let animator10 = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            self.d1.alpha = 1
            //self.d.transform = self.negativeinitialdistance
        })
        animator10.startAnimation(afterDelay: 1.5)
        
    }
    
    func loadpt2()
    {
        a2.isEnabled = true
        b2.isEnabled = true
        c2.isEnabled = true
        d2.isEnabled = true
        let animator1 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.btextview.alpha = 1
        })
        animator1.startAnimation()
        let animator2 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a2.alpha = 1
        })
        animator2.startAnimation(afterDelay: 0.25)
        let animator3 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b2.alpha = 1
        })
        animator3.startAnimation(afterDelay: 0.5)
        let animator4 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c2.alpha = 1
        })
        animator4.startAnimation(afterDelay: 0.75)
        let animator5 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d2.alpha = 1
        })
        animator5.startAnimation(afterDelay: 1)
    }
    
    func correctanswer1()
    {
        a1.backgroundColor = UIColor.red
        b1.backgroundColor = UIColor.red
        c1.backgroundColor = UIColor.green
        d1.backgroundColor = UIColor.red
        a1.isEnabled = false
        b1.isEnabled = false
        c1.isEnabled = false
        d1.isEnabled = false
        loadpt2()
    }
    func wronganswer1()
    {
        a1.backgroundColor = UIColor.red
        b1.backgroundColor = UIColor.red
        c1.backgroundColor = UIColor.green
        d1.backgroundColor = UIColor.red
        a1.isEnabled = false
        b1.isEnabled = false
        c1.isEnabled = false
        d1.isEnabled = false
        why2.isEnabled = true
        why2.alpha = 1
    }
    func correctanswer2()
    {
        a2.backgroundColor = UIColor.red
        b2.backgroundColor = UIColor.green
        c2.backgroundColor = UIColor.red
        d2.backgroundColor = UIColor.red
        NextBtn.isEnabled = true
        NextBtn.alpha = 1
        NextBtn.backgroundColor = UIColor.green
        a2.isEnabled = false
        b2.isEnabled = false
        c2.isEnabled = false
        d2.isEnabled = false
    }
    func wronganswer2()
    {
        a2.backgroundColor = UIColor.red
        b2.backgroundColor = UIColor.green
        c2.backgroundColor = UIColor.red
        d2.backgroundColor = UIColor.red
        a2.isEnabled = false
        b2.isEnabled = false
        c2.isEnabled = false
        d2.isEnabled = false
        why3.isEnabled = true
        why3.alpha = 1
    }
    
    
    @IBAction func a1touch(_ sender: UIButton) {
        wronganswer1()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b1.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c1.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d1.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func b1touch(_ sender: UIButton) {
        wronganswer1()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a1.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c1.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d1.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func c1touch(_ sender: UIButton) {
        correctanswer1()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a1.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b1.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d1.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
         scorv2s1 = scorv2s1 + 1
    }
    @IBAction func d1touch(_ sender: UIButton) {
        wronganswer1()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a1.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b1.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c1.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func a2touch(_ sender: UIButton) {
        wronganswer2()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b2.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c2.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d2.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func b2touch(_ sender: UIButton) {
        correctanswer2()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a2.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c2.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d2.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
        
        scorv2s1 = scorv2s1 + 1
    }
    @IBAction func c2touch(_ sender: UIButton) {
        wronganswer2()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a2.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b2.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.d2.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func d2touch(_ sender: UIButton) {
        wronganswer2()
        let animator6 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.a2.alpha = 0.4
        })
        animator6.startAnimation(afterDelay: 0)
        let animator7 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.b2.alpha = 0.4
        })
        animator7.startAnimation(afterDelay: 0.25)
        let animator8 = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.c2.alpha = 0.4
        })
        animator8.startAnimation(afterDelay: 0.5)
    }
    @IBAction func why2press(_ sender: UIButton) {
        correctanswer1()
        loadpt2()
    }
    @IBAction func why3press(_ sender: UIButton) {
        NextBtn.alpha = 1
        NextBtn.isEnabled = true
        NextBtn.backgroundColor = UIColor.green
    }
    @IBAction func nextpress(_ sender: UIButton) {
        let animator22 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.enunt1.transform = transitiondistance
        })
        animator22.startAnimation()
        let animator11 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.imgview.transform = transitiondistance
        })
        animator11.startAnimation(afterDelay: 0.15)
        let animator1 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.aparanteza.transform = transitiondistance
        })
        animator1.startAnimation(afterDelay: 0.3)
        let animator2 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            // self.a.alpha = 1
            self.a1.transform = transitiondistance
        })
        animator2.startAnimation(afterDelay: 0.45)
        let animator3 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.b.alpha = 1
            self.b1.transform = transitiondistance
        })
        animator3.startAnimation(afterDelay: 0.6)
        let animator4 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.c.alpha = 1
            self.c1.transform = transitiondistance
        })
        animator4.startAnimation(afterDelay: 0.75)
        let animator5 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.d.alpha = 1
            self.d1.transform = transitiondistance
        })
        animator5.startAnimation()
        let animator6 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            //self.d.alpha = 1
            self.why3.transform = transitiondistance
            self.why2.transform = transitiondistance
        })
        animator6.startAnimation(afterDelay: 0.15)
        let animator7 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.d2.transform = transitiondistance
        })
        animator7.startAnimation(afterDelay: 0.3)
        let animator8 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.c2.transform = transitiondistance
        })
        animator8.startAnimation(afterDelay: 0.45)
        let animator9 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.b2.transform = transitiondistance
        })
        animator9.startAnimation(afterDelay: 0.6)
        let animator10 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.a2.transform = transitiondistance
        })
        animator10.startAnimation(afterDelay: 0.75)
        let animatorlast = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.btextview.transform = transitiondistance
            self.NextBtn.alpha = 0
        })
        animatorlast.startAnimation(afterDelay: 0.9)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "why4" {
            let popoverViewController = segue.destination //as! UIViewController /*yourviewcontroller*/
            let vc = segue.destination
            vc.preferredContentSize = CGSize(width: 320, height: 290)
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
        else if segue.identifier == "why5"
        {
            let popoverViewController = segue.destination //as! UIViewController /*yourviewcontroller*/
            let vc = segue.destination
            vc.preferredContentSize = CGSize(width: 320, height: 270)
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
