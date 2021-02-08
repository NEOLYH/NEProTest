//
//  ViewController.swift
//  NEProTest
//
//  Created by LuLuLu on 2021/2/8.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        UserDefaults.standard.set("我是存储的数据", forKey: "WoodStock")
        UserDefaults.standard.synchronize()
        
        sandbox()
    }
    
    func sandbox(){
        // 获取沙盒主目录路径
        let string = NSHomeDirectory()
        print("沙盒主目录路径" + string)
        
        // 获取Documents目录路径
        let docDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
        print("Documents目录路径" + docDir)
        
        // 获取Library的目录路径
        let libDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
        print("Library的目录路径" + libDir)
        
        // 获取Caches目录路径
        let cachesDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
        print("Caches目录路径" + cachesDir)
        
        // 获取tmp目录路径
        let temDir = NSTemporaryDirectory()
        print("tmp目录路径" + temDir)
        

        let newPath = docDir.appending("/text.txt")
        let url = URL(fileURLWithPath: newPath)
        let name = "UMR"
        do {
            try name.write(to: url, atomically: true, encoding: .utf8)
        } catch {
           
        }
    }
}

