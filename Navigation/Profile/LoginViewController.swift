//
//  LogInViewController.swift
//  Navigation
//
//  Created by Mikhail Belokhvostov on 06.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let scrollView = UIScrollView()
    let containerView = UIView()

    var labelImage: UIImageView = {
        let labelImage = UIImageView()
        labelImage.image = UIImage(named: "logo")
        labelImage.translatesAutoresizingMaskIntoConstraints = false
        return labelImage
    }()

    var emailOrPhoneTextField: UITextField = {
        let emailOrPhoneTextField = UITextField()
        emailOrPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        emailOrPhoneTextField.insertText("   E-mail or phone", alternatives: ["Введите e-mail или номер телефона"], style: .none)
        emailOrPhoneTextField.textColor = .gray
        emailOrPhoneTextField.tintColor = .black
        emailOrPhoneTextField.backgroundColor = .systemGray6
        emailOrPhoneTextField.layer.borderWidth = 0.5
        emailOrPhoneTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailOrPhoneTextField.layer.cornerRadius = 10
        emailOrPhoneTextField.autocapitalizationType = .none
        return emailOrPhoneTextField
    }()

    var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.insertText("  Password", alternatives: ["Введите пароль"], style: .none)
        passwordTextField.textColor = .gray
        passwordTextField.tintColor = .black
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocapitalizationType = .none
        return passwordTextField
    }()

    var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log in", for: .normal)
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.layer.masksToBounds = true
        logInButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return logInButton
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.keyboardDismissMode = .onDrag
        
        containerView.addSubview(labelImage)
        containerView.addSubview(emailOrPhoneTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(logInButton)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            labelImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 120),
            labelImage.widthAnchor.constraint(equalToConstant: 100),
            labelImage.heightAnchor.constraint(equalToConstant: 100),
            labelImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            emailOrPhoneTextField.topAnchor.constraint(equalTo: labelImage.bottomAnchor, constant: 120),
            emailOrPhoneTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            emailOrPhoneTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            emailOrPhoneTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailOrPhoneTextField.bottomAnchor, constant: 0),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0)
        ])
        
    }

    @objc func pressButton() {
        print("Проверка нажатия кнопки")
        
        let profileViewControllerStoryBoard = self.storyboard?.instantiateViewController(identifier: "Profile") as! ProfileViewController
            navigationController?.pushViewController(profileViewControllerStoryBoard, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}




 
