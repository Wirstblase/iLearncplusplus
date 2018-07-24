//
//  BasicTeorieViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/20/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class BasicTeorieViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       load( file: lectiefilename[whatindex] )

        // Do any additional setup after loading the view.
    }
    
    func load(file name:String){
        
        if let rtfPath = Bundle.main.url(forResource: name, withExtension: "rtf") {
            do {
                let attributedStringWithRtf: NSAttributedString = try NSAttributedString(url: rtfPath, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
                self.textView.attributedText = attributedStringWithRtf
            } catch let error {
                print("Got an error \(error)")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
