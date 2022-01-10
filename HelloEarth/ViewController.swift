//
//  ViewController.swift
//  HelloEarth
//
//  Created by Jae Lee on 1/9/22.
//

import UIKit

class ViewController: UIViewController {
    private var theViewC: MaplyBaseViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create empty map and add to view
        theViewC = MaplyViewController(mapType: .typeFlat)
        self.view.addSubview(theViewC!.view)
        theViewC!.view.frame = self.view.bounds
        addChild(theViewC!)
    }
}
