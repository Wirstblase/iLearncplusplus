//
//  V1S1ScoreViewController.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 14/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class V1S1ScoreViewController: UIViewController {

    @IBOutlet weak var exitbtn: UIButton!
    @IBOutlet weak var bravo: UILabel!
    @IBOutlet weak var scorultauestede: UILabel!
    @IBOutlet weak var bgcircle: UIButton!
    @IBOutlet weak var scor: UILabel!
    @IBOutlet weak var punctedin3: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bravo.transform = initialdistance
        scorultauestede.transform = initialdistance
        bgcircle.transform = initialdistance
        scor.transform = initialdistance
        punctedin3.transform = initialdistance
        exitbtn.transform = initialdistance
        
        bgcircle.layer.cornerRadius = 50
        exitbtn.layer.cornerRadius = 10
        scor.text = "\(scorv1s1)"
        savescore()
        
        if(scorv1s1 == 3)
        {
            bravo.text = "Perfect!"
            scor.textColor = UIColor.blue
            bravo.textColor = UIColor.blue
            scorultauestede.textColor = UIColor.blue
            bgcircle.backgroundColor = UIColor.blue
            punctedin3.textColor = UIColor.blue
        }
        else if(scorv1s1 == 2)
        {
            bravo.text = "Bravo!"
            scor.textColor = UIColor.green
            bravo.textColor = UIColor.green
            scorultauestede.textColor = UIColor.green
            bgcircle.backgroundColor = UIColor.green
            punctedin3.textColor = UIColor.green
        }
        else if(scorv1s1 == 1)
        {
            bravo.text = "okay.."
            scor.textColor = UIColor.yellow
            bravo.textColor = UIColor.yellow
            scorultauestede.textColor = UIColor.yellow
            bgcircle.backgroundColor = UIColor.yellow
            punctedin3.textColor = UIColor.yellow
            punctedin3.text = "Punct din 3"
        }
        else if(scorv1s1 == 0)
        {
            bravo.text = "..."
            scor.textColor = UIColor.red
            bravo.textColor = UIColor.red
            scorultauestede.textColor = UIColor.red
            bgcircle.backgroundColor = UIColor.red
            punctedin3.textColor = UIColor.red
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scor.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {self.scor.alpha = 1})
        UIView.animate(withDuration: 0.5, animations: {self.scor.alpha = 1})
        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.bravo.transform = negativeinitialdistance
        })
        animator.startAnimation(afterDelay: 0.3)
        let animator1 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.scorultauestede.transform = negativeinitialdistance
        })
        animator1.startAnimation(afterDelay: 0.45)
        let animator2 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.bgcircle.transform = negativeinitialdistance
            self.scor.transform = negativeinitialdistance
        })
        animator2.startAnimation(afterDelay: 0.6)
        let animator3 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.punctedin3.transform = negativeinitialdistance
        })
        animator3.startAnimation(afterDelay: 0.75)
        let animator4 = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            self.exitbtn.transform = negativeinitialdistance
        })
        animator4.startAnimation(afterDelay: 0.9)
        
     
    }
 
    @IBAction func exitpress(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bravo.transform = transitionup
            self.scor.transform = transitionup
            self.scorultauestede.transform = transitionup
            self.punctedin3.transform = transitionup
            self.bgcircle.transform = transitionup
        })
        UIView.animate(withDuration: 0.4, animations: {
            self.exitbtn.alpha = 0
            self.scorultauestede.alpha = 0
            self.bravo.alpha = 0
            self.punctedin3.alpha = 0
            self.bgcircle.alpha = 0
            self.scor.alpha = 0
        })
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
