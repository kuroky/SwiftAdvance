//
//  ViewController.swift
//  SwiftAdvance
//
//  Created by kuroky on 2018/8/16.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataList: [ItemModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift Advance"
        setupData()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
    }
    
    func setupData() {
        guard let path = Bundle.main.path(forResource: "Json", ofType: "json") else {
            return
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        
        let decode = JSONDecoder()
        let items = try? decode.decode([ItemModel].self, from: data!)
        
        dataList = items ?? [ItemModel]()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = dataList[section]
        return item.isExplosion ? (item.items?.count)! + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = dataList[indexPath.section]
        let sectionIndex = String(indexPath.section + 1) + "."
        if indexPath.row == 0 {
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = sectionIndex + " " + item.title!
        }
        
        if item.items != nil && indexPath.row != 0 {
            let rowIndex = "    " + sectionIndex + String(indexPath.row) + " "
            cell.accessoryType = .none
            let subItem = item.items![indexPath.row - 1]
            cell.textLabel?.text = rowIndex + subItem.title!
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = dataList[indexPath.section]
        
        if indexPath.row != 0 {
            let sectionIndex = String(indexPath.section + 1) + "."
            let rowIndex = sectionIndex + String(indexPath.row)
            let story = UIStoryboard(name: "Main", bundle: nil)
            let detailVC = story.instantiateViewController(withIdentifier: "DetailViewControllerID") as! DetailViewController
            let subItem = item.items![indexPath.row - 1]
            detailVC.naviTitle = subItem.title
            detailVC.mdFileName = rowIndex
            self.navigationController?.pushViewController(detailVC, animated: true)
            return
        }
        
        item.isExplosion = !item.isExplosion
        let indexSet = IndexSet(integer: indexPath.section)
        tableView.reloadSections(indexSet, with: .none)
    }
}
