//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mikhail Belokhvostov on 23.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: self.view.frame.width, height: self.view.frame.height)
    }
}
