//
//  HomeScreenViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/21/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

var globalcontinut = ""
var globalcommentarray = ["", ""]

struct Post{
   var name : String
    var title : String
    var content : String
    var data : Date
    
    var dictionary:[String:Any]{
        return [
            "name" : name,
            "title" : title,
            "content" : content,
            "data" : data
        ]
    }
}

var pressedlogout = false

class HomeScreenViewController: UIViewController, UIPopoverPresentationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var addbtnbg: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bgblur: UIVisualEffectView!
    @IBOutlet weak var bgimg: UIImageView!
    
    var postArray = [Post]()
    
    var db:Firestore!
    
    func loadData() {
        db.collection("Posts").getDocuments() {
            QuerySnapshot, error in
            if let error = error {
                print("ErOare: \(error.localizedDescription)")
            } else {
                self.postArray = QuerySnapshot!.documents.flatMap({Post(dictionary: $0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.alpha = 0
                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {self.tableView.alpha = 1})
                }
            }
        }
    }
    
    func checkForUpdates() {
        
        db.collection("Posts").whereField("data", isGreaterThan: Date() )
            .addSnapshotListener {
                QuerySnapshot, error in
                
                guard let snapshot = QuerySnapshot else {return}
                
                snapshot.documentChanges.forEach {
                    diff in
                    if diff.type == .added {
                        self.postArray.append(Post(dictionary: diff.document.data()
                        )!)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        loadData()
        checkForUpdates()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        addbtnbg.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
        bgblur.effect = nil
        bgimg.alpha = 0
        tableView.alpha = 0
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut, animations: {
            self.bgblur.effect = UIBlurEffect(style: .dark)
            self.bgimg.alpha = 0.6
        })
    }
    
    @IBAction func backPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SocialTableViewCell", for: indexPath) as! SocialTableViewCell
        
        let post = postArray[indexPath.row]
        
        cell.titlelabel.text = post.title
        cell.usernamelabel.text = post.name
        cell.datalabel.text = "\(post.data)"
        
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "loadpost", sender: self)
        let post = postArray[indexPath.row]
        globalcontinut = post.content
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        if(pressedlogout)
        {
            pressedlogout = false
            performSegue(withIdentifier: "GOBACK", sender: self)
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

func addtodatabase(document: String, username: String, titlu: String, continut: String) {
    let db = Firestore.firestore()
    
    let newPost = Post(name: username, title: titlu, content: continut, data: Date() )
    
    var ref:DocumentReference? = nil
    ref = db.collection("Posts").addDocument(data: newPost.dictionary) {
        error in
        
        if let error = error {
            print("Error adding document: \(error.localizedDescription)")
        } else {
            print("Document creat cu ID: \(ref!.documentID)")
        }
    }
   /* db.collection("Posts").document(document).setData([
        "Username" : username,
        "Title" : titlu,
        "Continut" : continut
    ]) {
        (error:Error?) in
        if let error = error {
            print("errOr: \(error.localizedDescription)")
        } else {
            print("Document has been successfully written to!")
        }
    }*/
    
}

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

extension Post : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
        let title = dictionary["title"] as? String,
        let content = dictionary["content"] as? String,
        let data = dictionary["data"] as? Date
        else {return nil}
        
        self.init(name: name, title: title, content: content, data: data)
    }
}






