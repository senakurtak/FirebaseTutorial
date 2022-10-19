//
//  SecondViewController.swift
//  FirebaseTutorial
//
//  Created by Sena Kurtak on 12.10.2022.
//

import UIKit
import FirebaseAuth

class SecondViewController: UIViewController {

    var signOutButton = UIButton()
    var labelWelcome = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpUI()
    }
    
    func setUpUI(){
        view.addSubview(signOutButton)
        signOutButton.backgroundColor = .systemGreen
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.setTitle("Log off", for: .normal)
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        signOutButton.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 80)

        view.addSubview(labelWelcome)
        labelWelcome.textAlignment = .center
        labelWelcome.text = "Welcome!"
        labelWelcome.font = .systemFont(ofSize: 24, weight: .semibold)
        labelWelcome.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
    }
    @objc func signOutButtonTapped(){
        let destVC = ViewController()
        destVC.modalPresentationStyle = .fullScreen
        present(destVC, animated: true)
    }
    
}
