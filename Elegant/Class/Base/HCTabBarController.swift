//
//  HCTabBarController.swift
//  Elegant
//
//  Created by 陆 on 21/11/2017.
//  Copyright © 2017 陆. All rights reserved.
//

import UIKit

class HCTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    let HCDrivesVC = HCDrivesViewController()
    let HCPlantsVC = HCPlantViewController()
    let HCCommunityVC  =  HCCommunityViewController()
    let HCPersonalVC = HCPersonalViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
