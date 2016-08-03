//
//  TremorNavigationViewController.swift
//  TremorDemo
//
//  Created by Heather Stark on 4/28/16.
//  Copyright © 2016 Tremor Video. All rights reserved.
//

import UIKit

class TremorNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func shouldAutorotate() -> Bool {
        return true;
    }
    
    // defer to the supported orientations of the view controller being shown
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return (self.topViewController?.supportedInterfaceOrientations())!
    }
    
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return (self.topViewController?.preferredInterfaceOrientationForPresentation())!
    }


}
