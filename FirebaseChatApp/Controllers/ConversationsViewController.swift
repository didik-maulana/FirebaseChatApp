//
//  ViewController.swift
//  FirebaseChatApp
//
//  Created by Didik Maulana Ardiansyah on 04/08/22.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "is_logged_in")
        
        if !isLoggedIn {
            let loginVC = LoginViewController()
            let navigation = UINavigationController(rootViewController: loginVC)
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: false)
        }
    }
}
