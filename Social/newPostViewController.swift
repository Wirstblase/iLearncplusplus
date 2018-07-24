//
//  newPostViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/22/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class newPostViewController: UIViewController {
    @IBOutlet weak var titlefield: UITextField!
    @IBOutlet weak var continuttextfield: UITextView!
    @IBOutlet weak var postcommentbtn: UIButton!
    @IBOutlet weak var buttonBottomdistance: NSLayoutConstraint!
    
    @IBOutlet weak var cancelbtn: UIButton!
    @IBOutlet weak var bgblur: UIVisualEffectView!
    var keyboardisup = false
    var keyboardheighT = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
    }
    /*@objc func keyboardWillAppear() {
        UIView.animate(withDuration: 0.2, animations: {
            self.postcommentbtn.transform = CGAffineTransform(translationX: 0, y: -self.keyboardheighT)
            //self.buttonBottomdistance.constant = self.keyboardheighT
        })
    }*/
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            print(keyboardHeight)
            keyboardheighT = keyboardHeight
            
            UIView.animate(withDuration: 0.2, animations: {
                self.postcommentbtn.transform = CGAffineTransform(translationX: 0, y: -self.keyboardheighT)
                self.cancelbtn.transform = CGAffineTransform(translationX: 0, y: -self.keyboardheighT)
            })
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
            UIView.animate(withDuration: 0.2, animations: {
                self.postcommentbtn.transform = CGAffineTransform.identity
                self.cancelbtn.transform = CGAffineTransform.identity
        })
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {self.bgblur.effect = nil})
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {self.bgblur.effect = UIBlurEffect(style: .regular)})
    }
    
    
    

    @IBAction func NewPost(_ sender: Any) {
        
        let numeuser = Auth.auth().currentUser?.displayName
        
        addtodatabase(document: "Post", username: numeuser!, titlu: titlefield.text!, continut: continuttextfield.text)
        postcommentbtn.isEnabled = false
        postcommentbtn.setTitle("uploaded!", for: .normal)
        cancelbtn.setTitle("Close", for: .normal)
        titlefield.isEnabled = false
        continuttextfield.isEditable = false
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

