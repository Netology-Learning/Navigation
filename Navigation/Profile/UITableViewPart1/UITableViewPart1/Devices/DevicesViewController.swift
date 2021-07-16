//
//  ViewController.swift
//  UITableViewPart1
//
//  Created by Mikhail Belokhvostov on 15.07.2021.
//

import UIKit

class DevicesViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        let constraints = [
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    // 21:19

}

