//
//  ViewController.swift
//  customTableViewCell
//
//  Created by Wirstblase on 01/03/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

let lectiefilename = ["","vect","ocuvect","matr","ocumatr","fisiere","strings","pointer","struct","subprogr","subprogrec"]
let lectietitle = ["Algoritmi elementari", "Vectori", "Operatii cu vectori", "Matrici","Operatii cu matrici","Fisiere","Siruri de caractere", "Tipul de date pointer", "Tipul de date struct" , "Subprograme", "Subprograme recursive"]
var whatindex = 0

var tableviewistransitioned = false

struct Object {
    let type: String
    let belonging: [String]
}

class ThirdTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var objects = [Object]()
  
    @IBOutlet weak var dismissbtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        dismissbtn.layer.cornerRadius = 12
        dismissbtn.alpha = 1
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let Cls9 = Object(type: "Cls9", belonging: ["Algoritmi elementari", "Vectori", "Operatii cu vectori", "Matrici","Operatii cu matrici","Fisiere"])
        let Cls10 = Object(type: "Cls10", belonging: ["Siruri de caractere", "Tipul de date pointer", "Tipul de date struct" , "Subprograme", "Subprograme recursive"])
        objects.append(Cls9)
        objects.append(Cls10)
        
        super.viewDidLoad()
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))
        edgePan.edges = .left
        
        view.addGestureRecognizer(edgePan)
        
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
            print("Swipe Up")
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.down {
            print("Swipe Down")
        }
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            performSegue(withIdentifier: "Exit2", sender: self)
            teoriemovedup = false
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
        dismissbtn.transform = CGAffineTransform(translationX: 0, y: 400)
        dismissbtn.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.dismissbtn.alpha = 0.2
        })
        UIView.animate(withDuration: 0.2, delay: 0.5, animations: {
            self.dismissbtn.alpha = 1
        })
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {self.dismissbtn.transform = CGAffineTransform(translationX: 0, y: 0)})
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects[section].belonging.count
    }
    
    @IBAction func dismissbtntouch(_ sender: UIButton) {
        //dismiss(animated: true, completion: nil)
        godown()
    }
    
    @IBAction func dismissbtntouchcancel(_ sender: UIButton) {
        godown()
    }
    
    @IBAction func touchdown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut, animations: {
            self.dismissbtn.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        })
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseInOut, animations: {
            self.dismissbtn.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
    }
    
    
    func godown()
    {
        let tableviewdownpos = CGAffineTransform(translationX: 0, y: 1000)
       // UIView.animate(withDuration: 0.4, animations: {self.tableView.transform = tableviewdownpos})
        performSegue(withIdentifier: "exitfromteorie", sender: self)
        
        UIView.animate(withDuration: 3, animations: {self.dismissbtn.transform = CGAffineTransform(translationX: 0, y: 200)})
        UIView.animate(withDuration: 5, animations: {
            self.dismissbtn.alpha = 0
            self.dismissbtn.transform = CGAffineTransform(scaleX: 10, y: 100)
        })
        
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        
        
        //let tableViewHeight = tableView.bounds.size.height
        
        //for cell in cells {
          //  cell.transform = CGAffineTransform(translationX: 0, y: -tableViewHeight)
        //}
        
        var delayCounter = 2
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = tableviewdownpos
                
                
            }, completion: nil)
            delayCounter += 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .allowUserInteraction, animations: {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        })
        
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.5,initialSpringVelocity: 6 , options: .allowUserInteraction, animations: {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },completion: nil)
        
    } //Face cellul bouncy cand e selectat
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    } //face cellul sa isi revina dupa ce e deselectat
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    @IBOutlet weak var tableblurview: UIVisualEffectView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        whatindex = indexPath.row
        
        UIView.animate(withDuration: 1.2, animations:{
            self.tableView.transform = CGAffineTransform(translationX: -500, y: 0)
            tableviewistransitioned = true
            
        })
        UIView.animate(withDuration: 0.2, animations: {
            self.tableView.alpha = 0
            self.tableblurview.alpha = 0
            self.dismissbtn.alpha = 0
        })
        //face tabelul sa se miste in stanga, ca tranzitie pentru navigare
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if(whatindex == 0)
            {
                self.performSegue(withIdentifier: "Algoritmi elementari", sender: ceil)
            } else {
                self.performSegue(withIdentifier: "loadtheory", sender: ceil)
            }
           // self.performSegue(withIdentifier: self.objects[indexPath.section].belonging[indexPath.row], sender: ceil)
            //simplest and most efficient way to get it change screens
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        if(tableviewistransitioned)
        {
        UIView.animate(withDuration: 0, animations:{
        self.tableView.transform = CGAffineTransform(translationX: 0, y: 0)
        })
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                self.dismissbtn.alpha = 1
                self.tableblurview.alpha = 1
                self.tableView.alpha = 1})
            tableviewistransitioned = false
        }
    }
    
    
    
    /*public*/ func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdCustomViewCell") as! ThirdTableViewCell
        let cls9lectii = ["Algoritmi elementari", "Vectori", "Operatii cu vectori", "Matrici","Operatii cu matrici","Fisiere"]
        let cls10lectii = ["Siruri de caractere", "Tipul de date pointer", "Tipul de date struct" , "Subprograme", "Subprograme recursive"]
        
        cell.CellView3.layer.cornerRadius = cell.CellView3.frame.height / 2
        
        cell.Lbl3.textColor = UIColor.white
        
        cell.Lbl3.text = objects[indexPath.section].belonging[indexPath.row]
        
        
       if(cell.Lbl3.text == cls9lectii[indexPath.row])
        {
            cell.CellView3.backgroundColor = UIColor.skyblue
        }
        else if (cell.Lbl3.text == cls10lectii[indexPath.row])
        {
            cell.CellView3.backgroundColor = UIColor.clovergreen
        }
        tableView.sectionIndexColor = UIColor.clear
        //ar trebui sa schimbe culoarea sectionindexului la alb ;-;
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0)
        {
        return 50
        }
        else {return 10}
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return objects[section].type
        return " "
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 3
    }
    
    
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
               
            
            }, completion: nil)
            delayCounter += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
    }
    
    
}

















