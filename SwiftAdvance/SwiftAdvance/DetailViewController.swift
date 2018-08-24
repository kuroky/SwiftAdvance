//
//  DetailViewController.swift
//  SwiftAdvance
//
//  Created by kuroky on 2018/8/22.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import Down

class DetailViewController: UIViewController {

    var mdFileName: String!
    var naviTitle: String!
    @IBOutlet weak var hudView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData() {
        guard let json = loadResourceFile(fileName: mdFileName) else {
            return
        }
        startHud()
        guard let contentView = try? DownView(frame: self.view.bounds, markdownString: json, didLoadSuccessfully: { [weak self] in
            self?.stopHud()
        }) else { return }
        view.addSubview(contentView)
        view.bringSubview(toFront: hudView)
    }
    
    func setupUI() {
        navigationItem.title = naviTitle
    }
    
    func startHud() {
        hudView.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopHud() {
        view.isUserInteractionEnabled = true
        hudView.startAnimating()
        hudView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
