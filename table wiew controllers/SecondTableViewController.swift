//
//  ViewController.swift
//  customTableViewCell
//
//  Created by Wirstblase on 01/03/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//
var secondtablemoved = false

import UIKit

class SecondTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var egata = false
    
    let elements = ["Suma cifrelor unui nr", "Numarul de cifre ale unui nr", "Inversul unui nr", "Verificarea unui palindrom","Verificarea unui numar prim", "Descompunerea in factori primi", "CMMDC", "CMMMC"]
    let segueidentifiers = ["seg1", "seg2", "seg3", "seg4", "seg5","seg6", "seg7", "seg8"] //sa verifici daca toti sunt scrisi corect if one or more ain't working but at least one does
    let lectiefilename = ["",""]
    var whatindex = 0
    
    // @IBOutlet weak var Lbl: UIButton! //adaugat random sa vad daca merge
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
        
    
    /*
     var unde = "nicaieri" //variabila care ia titlul butonului apasat
     var caresegue = "niciunul"
     func nav() //functia care este chemata la apasarea butonului care te trimite la ecranul dorit (hopefully)
     {
     print("Button PRESSED")
     if(unde == "Vectori")
     {
     caresegue = "VectoriSegue"
     }
     performSegue(withIdentifier: caresegue, sender: ceil)
     }
     */
    
    
    
    
    
    
    
   
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8 //elements.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        whatindex = indexPath.row
        
        UIView.animate(withDuration: 1.2, animations:{
            self.tableView.transform = CGAffineTransform(translationX: -500, y: 0)
            secondtablemoved = true
            
        })
        UIView.animate(withDuration: 0.2, animations: {
            self.tableView.alpha = 0
        })
        //face tabelul sa se miste in stanga, ca tranzitie pentru navigare
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.performSegue(withIdentifier: self.segueidentifiers[indexPath.row], sender: ceil)
            //simplest and most efficient way to get it change screens
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(secondtablemoved)
        {
            UIView.animate(withDuration: 0, animations:{
                self.tableView.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {self.tableView.alpha = 1})
            secondtablemoved = false
        }
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCustomCell") as! SecondCustomTableViewCell
        
        cell.CellView2.layer.cornerRadius = cell.CellView2.frame.height / 2
        
        //cell.Lbl.SetLabel ( elements[indexPath.row], for: .normal )
        cell.Lbl2.text = elements[indexPath.row]
        // cell.animalImage.image = UIImage(named: elements[indexPath.row])
        //cell.animalImage.layer.cornerRadius = //cell.animalImage.frame.height / 2
        
        //if(ButTouch.isTouchInside == true)
        /*
         if(check == 1)
         {
         if(cell.Lbl.currentTitle == "Vectori" )
         {
         performSegue(withIdentifier: "VectoriSegue", sender: ceil)
         //check = 0 //daca check e 1 sa schimbe ecranul unde trebuie, apoi sa se intoarca la check 0
         }
         if(cell.Lbl.currentTitle == "Operatii cu vectori")
         {
         performSegue(withIdentifier: "OperatiicuvectoriSegue", sender: ceil)
         //check = 0
         }
         
         }
         */
        //cell.Lbl.addTarget(self, action: "nav" , for: UIControlEvents.touchUpInside)
        cell.selectionStyle = .none
        
        return cell
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
    
    
}

















