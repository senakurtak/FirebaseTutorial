//
//  ViewController.swift
//  FirebaseTutorial
//
//  Created by Sena Kurtak on 12.10.2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    var label = UILabel()
    var tfMail = UITextField()
    var tfPassword = UITextField()
    var buttonSignUp = UIButton()
    var buttonlogin = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        view.backgroundColor = .systemGray
        view.addSubview(label)
        label.textAlignment = .center
        label.text = "Log in"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        
        view.addSubview(tfMail)
        tfMail.placeholder = "Email"
        tfMail.layer.borderWidth = 1
        tfMail.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(tfPassword)
        tfPassword.placeholder = "Password"
        tfPassword.layer.borderWidth = 1
        tfPassword.isSecureTextEntry = true
        tfPassword.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(buttonSignUp)
        buttonSignUp.backgroundColor = .systemGreen
        buttonSignUp.setTitleColor(.white, for: .normal)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.addTarget(self, action: #selector(didTapButtonSignUp), for: .touchUpInside)
        
        
        view.addSubview(buttonlogin)
        buttonlogin.backgroundColor = .systemGreen
        buttonlogin.setTitleColor(.white, for: .normal)
        buttonlogin.setTitle("Log in", for: .normal)
        buttonlogin.addTarget(self, action: #selector(didTapButtonLogin), for: .touchUpInside)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        tfMail.frame = CGRect(x: 20,
                              y: label.frame.origin.y + label.frame.size.height + 10,
                              width: view.frame.size.width - 40,
                              height: 50)
        tfPassword.frame = CGRect(x: 20,
                                  y: tfMail.frame.origin.y + tfMail .frame.size.height + 10,
                                  width: view.frame.size.width - 40,
                                  height: 50)
        buttonSignUp.frame = CGRect(x: 20,
                                    y: tfPassword.frame.origin.y + tfPassword .frame.size.height + 10,
                                    width: view.frame.size.width - 40,
                                    height: 80)
        
        
        buttonlogin.frame = CGRect(x: 20,
                                   y: buttonSignUp.frame.origin.y + buttonSignUp .frame.size.height + 10,
                                   width: view.frame.size.width - 40,
                                   height: 50)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tfMail.becomeFirstResponder()
    }
    
    @objc private func didTapButtonSignUp(){
        if tfMail.text != "" {
            if tfPassword.text != "" {
                Auth.auth().createUser(withEmail: tfMail.text!, password: tfPassword.text!) { authResult, error in
                }
                let alert = UIAlertController(title: "Success", message: "Sign Up Succesfull.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel))
                present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: "Password must not be empty ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel))
                present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Email must not be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel))
            present(alert, animated: true)
        }
    }

    @objc private func didTapButtonLogin(){
        if tfMail.text != "" {
            if tfPassword.text != "" {
                Auth.auth().signIn(withEmail: tfMail.text!, password: tfPassword.text!) { authResult, error in
                }
                let destVC = SecondViewController()
                destVC.modalPresentationStyle = .fullScreen
                present(destVC, animated: true )
            } else {
                let alert = UIAlertController(title: "Error", message: "Password must not be empty ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel))
                present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Email must not be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel))
            present(alert, animated: true)
        }
    }
    
    func showCreateAccount(email: String, password: String){
        let alert = UIAlertController(title: "Create Account",
                                      message: "Would you like to create an account",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue",
                                      style: .default,
                                      handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                
            })
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .cancel,
                                      handler: {_ in
        }))
        
        present(alert, animated: true)
    }
}


