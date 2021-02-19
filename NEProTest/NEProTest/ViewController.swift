//
//  ViewController.swift
//  NEProTest
//
//  Created by LuLuLu on 2021/2/8.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    fileprivate var dataSource:[String] = ["Sanbox","自签名的证书进行HTTPS请求校验"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
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
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(SanboxViewController(), animated: true)
            break
        case 1:
            self.navigationController?.pushViewController(CerViewController(), animated: true)
            break
        default:
            break
        }
    }
    
    
}
