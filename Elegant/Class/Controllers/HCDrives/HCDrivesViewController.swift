//
//  HCDrivesViewController.swift
//  Elegant
//
//  Created by 陆 on 21/11/2017.
//  Copyright © 2017 陆. All rights reserved.
//

import UIKit

class HCDrivesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colorArray = NSArray(ofColorsWith: ColorScheme.analogous, using: UIColor.flatBlue(), withFlatScheme: true)
        
        self.view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.topToBottom, withFrame: self.view.frame, andColors: colorArray as! [Any])
        self.view.addSubview(self.mainTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private lazy var mainTableView: UITableView = {
       let tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.backgroundColor = UIColor.clear
        return tableView
    }()
}
