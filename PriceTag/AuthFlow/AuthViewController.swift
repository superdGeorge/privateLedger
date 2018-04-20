//
//  AuthViewController.swift
//  PriceTag
//
//  Created by George Zheng on 12/11/17.
//  Copyright © 2017 George Zheng. All rights reserved.
//

import UIKit
import FirebaseAuth
import NVActivityIndicatorView
import Spring

class AuthViewController: UIViewController {

    private let BACKGROUND_COLOR = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)
    
    
    var authStatehandle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var spinner: NVActivityIndicatorView!
    @IBOutlet weak var buttonContainer: SpringImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBAction func loginAction(_ sender: UIButton) {
        
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        authStatehandle = Auth.auth().addStateDidChangeListener{ (auth, user) in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let handle = authStatehandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customInit()
        spinner.startAnimating()
        UIView.animate(withDuration: 0) {
            self.spinner.alpha = 1
        }
        
        if let user = Auth.auth().currentUser {
            
        }else{
            spinner.alpha = 0
            buttonContainer.animation = "fadeInUp"
            buttonContainer.curve = "spring"
            buttonContainer.duration = 3
            buttonContainer.animate()
            
        }
    }
    
    private func customInit(){
        buttonContainer.alpha = 0
        
        loginBtn.backgroundColor = BACKGROUND_COLOR
        loginBtn.layer.cornerRadius = 23
        
        signupBtn.layer.borderColor = BACKGROUND_COLOR.cgColor
        signupBtn.layer.borderWidth = 1
        signupBtn.layer.cornerRadius = 23
        
    }
}

