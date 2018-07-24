//
//  BouncyButton.swift
//  iLearn c++ official
//
//  Created by Wirstblase on 28/05/2018.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

class BouncyButton: UIButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        })
        
        UIView.animate(withDuration: 0.5, delay: 0,usingSpringWithDamping: 0.5,initialSpringVelocity: 6 , options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        })
        super.touchesEnded(touches, with: event)
    }
    
}
