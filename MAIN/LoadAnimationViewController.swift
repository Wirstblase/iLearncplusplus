//
//  LoadAnimationViewController.swift
//  CameraShy
//
//  Created by Wirstblase on 24/06/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

var loadanimation = true

let BACCGROUNDCOLOR = UIColor.black

import UIKit

class LoadAnimationViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var titlelabel: UILabel!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadmenu()
    }
    
    func loadmenu()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.performSegue(withIdentifier: "loadd", sender: self)
        }
        loadanimation = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! MainMenuScreenViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = titlelabel.center
        transition.circleColor = BACCGROUNDCOLOR
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = titlelabel.center
        transition.circleColor = BACCGROUNDCOLOR
        return transition
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
