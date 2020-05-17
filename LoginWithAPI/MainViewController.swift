//
//  MainViewController.swift
//  LoginWithAPI
//
//  Created by Thien Tung on 5/13/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    } ()
    
    var getData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        loadData()
    }
        
    func loadData() {
            let viewVC = ViewController()
            
            viewVC.passData = { [weak self] data in
                guard let strongSelf = self else {return}
                strongSelf.getData = data
                strongSelf.textView.reloadInputViews()
            }
        }
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
