//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mikhail Belokhvostov on 23.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet weak var fullNameLabel: UILabel! {
        didSet {
          fullNameLabel.text = "Hipster Cat"
          fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
          fullNameLabel.textColor = .black
        }
      }

    @IBOutlet weak var avatarImageView: UIImageView!{
        didSet {
          avatarImageView.clipsToBounds = true
          avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
          avatarImageView.layer.borderWidth = 3
          avatarImageView.layer.borderColor = UIColor.white.cgColor
         }
        }

    @IBOutlet weak var statusLabel: UILabel! {
        didSet {
          statusLabel.text =  "Something there"
          statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
          statusLabel.textColor = .gray
        }
      }


    @IBOutlet weak var statusTextField: UITextField! {
        didSet {
          statusTextField.placeholder = "Something to status"
          statusTextField.layer.cornerRadius = 12
          statusTextField.layer.borderWidth = 1
          statusTextField.layer.borderColor = UIColor.black.cgColor
          statusTextField.backgroundColor = .white
          statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        }
      }

    @IBOutlet weak var setStatusButton: UIButton! {
        didSet {
          setStatusButton.setTitle("Show status", for: .normal)
          setStatusButton.backgroundColor = .systemBlue
          setStatusButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
          setStatusButton.layer.cornerRadius = 4
          setStatusButton.layer.shadowColor = UIColor.black.cgColor
          setStatusButton.layer.shadowOffset = CGSize(width: 0, height: 4)
          setStatusButton.layer.shadowRadius = 4
          setStatusButton.layer.shadowOpacity = 0.7
        }
      }
    @objc func tap(){
      statusLabel.text = statusTextField.text
      statusLabel.textAlignment = .center
    }
}
    
    
    
    





