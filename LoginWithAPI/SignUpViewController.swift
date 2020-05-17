//
//  SignUpViewController.swift
//  LoginWithAPI
//
//  Created by Thien Tung on 5/9/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let usernameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Username"
        tf.font = .systemFont(ofSize: 16)
        tf.textAlignment = .left
        tf.textColor = .black
        return tf
    } ()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.font = .systemFont(ofSize: 16)
        tf.textAlignment = .left
        tf.textColor = .black
        return tf
    } ()
    
    let rePasswordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password again"
        tf.font = .systemFont(ofSize: 16)
        tf.textAlignment = .left
        tf.textColor = .black
        return tf
    } ()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .cyan
        return button
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addComponents()

        setupLayout()
    }
    
    func addComponents() {
        view.addSubview(usernameTF)
        view.addSubview(passwordTF)
        view.addSubview(rePasswordTF)
        view.addSubview(signUpButton)
    }
    
    func setupLayout() {
        usernameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        usernameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 164).isActive = true
        usernameTF.widthAnchor.constraint(equalToConstant: 250).isActive = true
        usernameTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 12).isActive = true
        passwordTF.widthAnchor.constraint(equalToConstant: 250).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        rePasswordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        rePasswordTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 12).isActive = true
        rePasswordTF.widthAnchor.constraint(equalToConstant: 250).isActive = true
        rePasswordTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        signUpButton.topAnchor.constraint(equalTo: rePasswordTF.bottomAnchor, constant: 12).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        signUpButton.addTarget(self, action: #selector(signUpAcc), for: .touchUpInside)
    }
    
    @objc func signUpAcc() {
        dismiss(animated: true, completion: nil)
    }
}
