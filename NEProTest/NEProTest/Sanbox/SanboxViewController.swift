//
//  SanboxViewController.swift
//  NEProTest
//
//  Created by LuLuLu on 2021/2/19.
//

import UIKit

class SanboxViewController: UIViewController {

    
    var dataSource:[String] = []
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = UIColor.white
        title = "Sanbox"
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
        dataSource.append(docDir)
        
        // 获取Library的目录路径
        let libDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
        print("Library的目录路径" + libDir)
        dataSource.append(libDir)
        
        // 获取Caches目录路径
        let cachesDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first ?? ""
        print("Caches目录路径" + cachesDir)
        dataSource.append(cachesDir)
        
        // 获取tmp目录路径
        let temDir = NSTemporaryDirectory()
        print("tmp目录路径" + temDir)
        dataSource.append(temDir)
        

        let newPath = docDir.appending("/text.txt")
        let url = URL(fileURLWithPath: newPath)
        let name = "UMR"
        do {
            try name.write(to: url, atomically: true, encoding: .utf8)
        } catch {
           
        }
        tableView.reloadData()
    }
}


extension SanboxViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId:String = String(indexPath.row)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell.init()
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(SanboxViewController(), animated: true)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
