//
//  SubiecteViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 15/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

var moveupdowndist = 0 //230

let screenSize = UIScreen.main.bounds
let screenWidthdetermined = screenSize.width
let screenHeightdetermined = screenSize.height


import UIKit
import QuartzCore
import Hero

class SubiecteViewController: UIViewController {

    @IBOutlet weak var var2scor: UILabel!
    @IBOutlet weak var var1scor: UILabel!
    @IBOutlet weak var var3btn: UIButton!
    @IBOutlet weak var var2btn: UIButton!
    @IBOutlet weak var var1btn: UIButton!
    @IBOutlet weak var bgpic: UIImageView!
    @IBOutlet weak var barview: UIView!
    @IBOutlet weak var centerguide: UILabel!
    @IBOutlet weak var bar: UIButton!
    @IBOutlet weak var titlelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barview.backgroundColor = UIColor.clear
        
        titlelabel.hero.id = "pinklbl"
        bgpic.hero.id = "pinkpic"
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        checkscreensize()
        loadscore()
        
        var1scor.text = "\(scorv1s1)"
        var2scor.text = "\(scorv2s1)"
        
        titlelabel.shadowOffset = CGSize(width: -1, height: 1)
        titlelabel.shadowColor = UIColor.black
        titlelabel.layer.masksToBounds = false
        titlelabel.layer.shadowRadius = 2
        titlelabel.layer.shadowOpacity = 0.7
        titlelabel.layer.shouldRasterize = true
        
        self.effectView.effect = nil
        var3btn.layer.cornerRadius = 10
        var2btn.layer.cornerRadius = 10
        var1btn.layer.cornerRadius = 10
        var1scor.layer.cornerRadius = 10
        var2scor.layer.cornerRadius = 10
        var3btn.isEnabled = false
        var2btn.isEnabled = false
        var1btn.isEnabled = false
        var3btn.alpha = 0
        var2btn.alpha = 0
        var1btn.alpha = 0
        var1scor.alpha = 0
        var2scor.alpha = 0
        var1btn.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        var1scor.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        var2scor.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        //bar.transform = CGAffineTransform(scaleX: 1, y: 0.5)
        barview.layer.cornerRadius = 20
        bar.layer.cornerRadius = 20
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.up {
            moveup()
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.down {
            movedown()
        }
    }
    
    @IBAction func touchthebar(_ sender: UIButton) {
        moveup()
    }
   
    
    @IBOutlet weak var effectView: UIVisualEffectView!
    
    func blurbg()
    {
        
        
        UIView.animate(withDuration: 0.4) {
            self.effectView.effect = UIBlurEffect(style: .dark)
        }//face fundalul sa fie blurat
    }
    func removeblur()
    {
        
        UIView.animate(withDuration: 0.5) {
            self.effectView.effect = nil
        } //face fundalul sa nu mai fie blurat
        
       /*
        for subview in bgpic.subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
        */
    }
    
    func checkscreensize()
    {
        if(screenWidthdetermined == 320)
        {
            moveupdowndist = 230
        }
        else if(screenWidthdetermined > 320)
        {
            moveupdowndist = 281
        }
    }//verifica marimea ecranului ca sa determine cat de sus sa se duca meniul cu variante
    
    
    
    
    func moveup()
    {
        bar.isEnabled = false
        bar.setTitle(" ", for: .normal)
        let scaleup = CGAffineTransform(scaleX: 3, y: 3)
        let titlemoveup = CGAffineTransform(translationX: 0, y: -100)
        let moveup = CGAffineTransform(translationX: 0, y: CGFloat(-moveupdowndist))
        UIView.animate(withDuration: 0.5, animations:
        {
           self.barview.transform = scaleup.concatenating(moveup)
            self.bar.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
            self.titlelabel.transform = titlemoveup
            self.barview.layer.cornerRadius = 10
            self.bar.layer.cornerRadius = 10
        })
        varappear()
        blurbg()
    }//muta meniul in sus si face ca butoanele sa apara
    func movedown()
    {
        bar.isEnabled = true
        bar.setTitle("Enter", for: .normal)
        //barview.backgroundColor = UIColor.clear
        let scaledown = CGAffineTransform(scaleX: 1, y: 1)
        let movedown = CGAffineTransform(translationX: 0, y: 0)
        let titlemovedown = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 1, delay: 0.4, animations:
            {
               self.barview.transform = scaledown.concatenating(movedown)
                self.bar.transform = scaledown
                self.titlelabel.transform = titlemovedown
                self.barview.layer.cornerRadius = 20
                self.bar.layer.cornerRadius = 20
        })
        vardisappear()
        removeblur()
    }//muta meniul in jos si face butoanele sa dispara
    func varappear()
    {
        UIView.animate(withDuration: 0.3,delay: 0.5, animations: {self.var1btn.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.var1btn.alpha = 1
            if(scorv1s1 > 0){
            self.var1scor.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.var1scor.alpha = 1
            }
        })
        UIView.animate(withDuration: 0.3,delay: 0.8, animations: {self.var2btn.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.var2btn.alpha = 1
            if(scorv2s1 > 0)
            {
            self.var2scor.alpha = 1
                self.var2scor.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        })
        UIView.animate(withDuration: 0.3,delay: 1.1, animations: {self.var3btn.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.var3btn.alpha = 0.1
        })
            self.var1btn.isEnabled = true
            self.var2btn.isEnabled = true
        
    }
    func vardisappear()
    {
        UIView.animate(withDuration: 0.2, animations: {self.var1btn.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.var1btn.alpha = 0
            self.var1scor.alpha = 0
            self.var1scor.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        })
        UIView.animate(withDuration: 0.2,delay: 0.2, animations: {self.var2btn.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.var2btn.alpha = 0
            self.var2scor.alpha = 0
            self.var2scor.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        })
        UIView.animate(withDuration: 0.2,delay: 0.4, animations: {self.var3btn.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            self.var3btn.alpha = 0
        })
            self.var1btn.isEnabled = false
            self.var2btn.isEnabled = false
            self.var3btn.isEnabled = false
        
        
    }
    
    @IBAction func backbtnpress(_ sender: Any) {
        
        hero.isEnabled = true
        
        let VC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC1") as! MainMenuScreenViewController
        
        VC1.hero.modalAnimationType = .selectBy(presenting: .auto, dismissing: .auto)
        
        hero.replaceViewController(with: VC1)
        
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
