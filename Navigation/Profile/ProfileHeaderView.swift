//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mikhail Belokhvostov on 23.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelHipsterCat)
        addSubview(imageAvatar)
        addSubview(textField)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var labelHipsterCat: UITextField {
        let labelHipsterCat = UITextField (frame: CGRect(x: 146, y: -10, width: 200, height: 100))
        labelHipsterCat.text = "Hipster Cat"
        labelHipsterCat.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelHipsterCat.textColor = .black
        return labelHipsterCat
    }
 
    let imageAvatar: UIImageView = {
        let imageAvatar = UIImageView()
        imageAvatar.contentMode = .scaleAspectFill
        imageAvatar.image = #imageLiteral(resourceName: "cat")
        imageAvatar.frame = CGRect(x: 16, y: 16, width: 110, height: 110)
        imageAvatar.clipsToBounds = true //  пока не надо
        imageAvatar.layer.cornerRadius = imageAvatar.frame.height / 2
        imageAvatar.layer.borderWidth = 3
        imageAvatar.layer.borderColor = UIColor.white.cgColor
        return imageAvatar
    }()
    
    var textField: UITextField {
        let textField = UITextField(frame: CGRect(x: 146, y: 50, width: 150, height: 100))
        textField.text = "Waiting for something"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        return textField
    }

    var button: UIButton {
        let button = UIButton(frame: CGRect(x: 16, y: 140, width: 290, height: 50))
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 4

        button.addTarget(self, action: #selector(printRes), for: .touchUpInside)

        return button
    }
    

    @objc func printRes(_ sender: UIButton) {
        print(textField)
    }
    
}
    
    
    
    


