//
//  TeorieViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 15/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//
var teoriemovedup = false
var teorieanimateddown = false

import UIKit
import QuartzCore
import Hero

class TeorieViewController: UIViewController {
    
    let bgdefaultopacity = 0.8

    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var bgpic: UIImageView!
    @IBOutlet weak var barview: UIView!
    @IBOutlet weak var bar: UIButton!
    @IBOutlet weak var barblur: UIVisualEffectView!
    @IBOutlet weak var fakebackbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgpic.hero.id = "Leaves"
        titlelabel.hero.id = "bUtn"
        
    
        /*var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }*/
        
        view.backgroundColor = BACCGROUNDCOLOR
        
        titlelabel.layer.shadowOpacity = 0.8
        titlelabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        titlelabel.layer.shadowRadius = 12
        titlelabel.layer.shadowColor = UIColor.black.cgColor
        titlelabel.layer.masksToBounds = false
        
        self.barblur.effect = nil
        checkscreensize()
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
    
    override func viewDidAppear(_ animated: Bool) {
        if(teoriemovedup)
        {
        teoriemovedup = false
        }
        
    }
    @IBAction func backbtnpress(_ sender: Any) {
        hero.isEnabled = true
        
        let VC1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC1") as! MainMenuScreenViewController
        
        VC1.hero.modalAnimationType = .auto
        
        hero.replaceViewController(with: VC1)
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
    
    func moveup()
    {
        bar.isEnabled = false
        let scaleup = CGAffineTransform(scaleX: 5, y: 20)
        let titlemoveup = CGAffineTransform(translationX: 0, y: -100)
        let moveup = CGAffineTransform(translationX: 0, y: CGFloat(-moveupdowndist))
        UIView.animate(withDuration: 0.4, animations:
            {
                self.barview.transform = scaleup.concatenating(moveup)
                self.titlelabel.transform = titlemoveup
                
                self.barview.backgroundColor = UIColor.clear
                self.bar.layer.cornerRadius = 0
                self.barview.layer.cornerRadius = 0
        })
        UIView.animate(withDuration: 0.2, animations: {self.bar.alpha = 0
            self.fakebackbtn.alpha = 0
        })
        UIView.animate(withDuration: 1, animations: {self.barblur.effect = UIBlurEffect(style: .dark)
        })
        startthetimer()
        teoriemovedup = true
    }
    
    func moveupnotanimated()
    {
        bar.isEnabled = false
        let scaleup = CGAffineTransform(scaleX: 5, y: 15)
        let titlemoveup = CGAffineTransform(translationX: 0, y: -100)
        let moveup = CGAffineTransform(translationX: 0, y: CGFloat(-moveupdowndist))
        self.barview.transform = scaleup.concatenating(moveup)
        self.titlelabel.transform = titlemoveup
        self.barview.backgroundColor = UIColor.clear
        self.bar.layer.cornerRadius = 0
        self.barview.layer.cornerRadius = 0
        self.bar.alpha = 0
        self.barblur.effect = UIBlurEffect(style: .dark)
        self.fakebackbtn.alpha = 0
    }
    
    func checkscreensize()
    {
        if(screenWidthdetermined == 320)
        {
            moveupdowndist = 230
        }
        else if(screenWidthdetermined > 320)
        {
            moveupdowndist = 281   //height 4.inch=667  4inch=568
        }
    }
    
    func startthetimer()
    {
        _ = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(loadlearn), userInfo: nil, repeats: false)
    }
    
    @objc func loadlearn()
    {
        performSegue(withIdentifier: "loadteorie", sender: self)
    }
    func movedown()
    {
        bar.isEnabled = true
        let scaledown = CGAffineTransform(scaleX: 1, y: 1)
        let movedown = CGAffineTransform(translationX: 0, y: 0)
        let titlemovedown = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 1, animations:
            {
                self.barview.transform = scaledown.concatenating(movedown)
                self.titlelabel.transform = titlemovedown
                self.barview.backgroundColor = UIColor.white
                self.barblur.effect = nil
                self.bar.alpha = 0
                self.barview.layer.cornerRadius = 20
                self.bar.layer.cornerRadius = 20
        })
        UIView.animate(withDuration: 0.7, animations: {self.barblur.effect = nil
            self.bgpic.alpha = CGFloat(self.bgdefaultopacity)
        })
        UIView.animate(withDuration: 0.1, delay: 1, animations: {self.bar.alpha = 1
            self.fakebackbtn.alpha = 1
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(teoriemovedup == true)
        {
            moveupnotanimated()
            movedown()
        }
        
        if(teoriemovedup == false){
            
            if(loadanimation)
            {
                
                loadanimation = false
            }
            else
            {
                UIView.animate(withDuration: 1,delay: 0.5 ,options: .curveEaseIn, animations: {
                self.bgpic.alpha = CGFloat(self.bgdefaultopacity)
            })
            }
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
