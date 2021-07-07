//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mikhail Belokhvostov on 23.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var bottomButton: UIButton = {
        let bottomButton = UIButton()
        bottomButton.setTitle("Нижняя кнопка", for: .normal)
        bottomButton.backgroundColor = .black
        return bottomButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bottomButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,  constant: -10)
        ])
    }

}
