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
//
    let margin = 16

    var labelHipsterCat: UITextField {
        let labelHipsterCat = UITextField (frame: CGRect(x: 130, y: 100, width: 200, height: 100))
        labelHipsterCat.text = "Hipster Cat"
        labelHipsterCat.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelHipsterCat.textColor = .black
        return labelHipsterCat
    }

    var textField: UITextField {
        let textField = UITextField(frame: CGRect(x: 150, y: 200, width: 150, height: 100))
        textField.text = "Waiting for something"
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.textColor = .gray
        return textField
    }

    var button: UIButton {
        let button = UIButton(frame: CGRect(x: margin, y: 350, width: 344, height: 50))
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }

    @objc func buttonPressed() {
        print(textField)
    }
    
    let imageAvatar = UIImageView(image: #imageLiteral(resourceName: "cat"))

}

