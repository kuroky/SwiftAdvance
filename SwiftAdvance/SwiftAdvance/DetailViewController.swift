//
//  DetailViewController.swift
//  SwiftAdvance
//
//  Created by kuroky on 2018/8/22.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var jsonName: String!
    var dataList: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }

    func setupData() {
        
        guard let path = Bundle.main.path(forResource: jsonName, ofType: "json") else {
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return
        }
        
        let decode = JSONDecoder()
        let json = try? decode.decode(DetailItem.self, from: data)
        
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
