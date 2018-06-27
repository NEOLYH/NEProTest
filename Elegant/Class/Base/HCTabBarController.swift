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
        
        tabBar.tintColor = UIColor.init(red: 20/255.5, green: 197/255.5, blue: 119/255.5, alpha: 1) //tabbar 字体颜色
        tabBar.barTintColor = UIColor.white //tabbar 背景颜色
        
        self.addChildVC(childVC: HCDrivesViewController(), childTitle: "首页", imageName: "TarBar_home_nomal", selectedImageName: "TarBar_home_select")
        
        self.addChildVC(childVC: HCPlantViewController(), childTitle: "植物志", imageName: "TarBar_friend_nomal", selectedImageName: "TarBar_friend_select")
        
        self.addChildVC(childVC: HCCommunityViewController(), childTitle: "社区", imageName: "TarBar_mesege_nomal", selectedImageName: "TarBar_mesege_select")
        
        self.addChildVC(childVC: HCPersonalViewController(), childTitle: "个人中心", imageName: "TarBar_mine_nomal", selectedImageName: "TarBar_mine_select")
    }
    
    /// 添加子控制器
    private func addChildVC(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName:String)
    {
        let navigation = UINavigationController(rootViewController: childVC)
        navigation.navigationBar.tintColor = UIColor.white //item 字体颜色
        navigation.navigationBar.barTintColor = UIColor.init(red: 20/255.5, green: 197/255.5, blue: 119/255.5, alpha: 1) //背景颜色
//        let dict:NSDictionary = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
//        //标题颜色
//        navigation.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
//        
        childVC.title = childTitle
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(navigation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}




