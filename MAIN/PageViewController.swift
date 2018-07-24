//
//  PageViewController.swift
//  iLearn c++ official
//
//  Created by Macbook on 7/23/18.
//  Copyright © 2018 Wirstblase. All rights reserved.
//

import UIKit

var goingback = false
var goingforward = false

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    lazy var orderedViewControllers: [UIViewController] = {
       return [self.newVC(viewController: "Social"),
               self.newVC(viewController: "Learn"),
               self.newVC(viewController: "Practice")
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.dataSource = self
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {return nil}
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        goingback = true
        goingforward = false
        return orderedViewControllers[previousIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {return nil}
        let nextIndex = viewControllerIndex + 1
        guard orderedViewControllers.count != nextIndex else {
            return orderedViewControllers.first
        }
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        goingforward = true
        goingback = false
        return orderedViewControllers[nextIndex]
    }
    
    
    
    
    func newVC(viewController: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
        
    }
    

}


