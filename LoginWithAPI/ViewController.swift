//
//  ViewController.swift
//  LoginWithAPI
//
//  Created by Thien Tung on 5/9/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login in API"
        label.textAlignment = .center
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 22)
        return label
    } ()
    
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
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowOpacity = 1
        return button
    } ()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    } ()
    
    var passData: ((String) -> Void)?
    var dataStr: String = ""
    
    var isSuccess: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addComponents()
        setupLayout()
        setupButton()
        
        
    }
    
    func loginWithAPI() {
        let url = URL(string: "http://apis-fake.herokuapp.com/login")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/JSON", forHTTPHeaderField: "Content-Type")
        
        let parameter: [String: Any] = [
            "email": usernameTF.text!,
            "password": passwordTF.text!
        ]
        
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        let datatask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, let response = response as? HTTPURLResponse
                else { return }
            
            if response.statusCode == 200 {
                self.isSuccess = true
                let rawString = String.init(data: data, encoding: String.Encoding.utf8)
                self.dataStr = rawString!
                print(self.dataStr)
            } else {
                self.isSuccess = false
            }
        }
        datatask.resume()
        
        
    }
    
    func setupAlert() {
        let alert = UIAlertController(title: "", message: isSuccess ? "Đăng nhập thành công" : "Đăng nhập thất bại", preferredStyle: .alert)
        let done = UIAlertAction(title: "OK", style: .default) { (_) in
            if self.isSuccess {
                print(self.isSuccess)
//                self.passData!(self.dataStr)
                self.nextVC()
            }
        }
        alert.addAction(done)
        present(alert, animated: true, completion: nil)
    }
    
    func nextVC() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        self.present(mainVC, animated: true, completion: nil)
    }
    
    func addComponents() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(usernameTF)
        containerView.addSubview(passwordTF)
        containerView.addSubview(loginButton)
        containerView.addSubview(signUpButton)
    }
    
    func setupLayout() {
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 64).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        titleLabel.sizeToFit()
        
        usernameTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
        usernameTF.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        usernameTF.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
        usernameTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 20).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        
        signUpButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        signUpButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10).isActive = true
        
        
    }
    
    func setupButton() {
        loginButton.addTarget(self, action: #selector(loginApp), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpAcc), for: .touchUpInside)
        
    }
    
    @objc func loginApp() {
        loginWithAPI()
        setupAlert()
        
    }
    
    @objc func signUpAcc () {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    
}

