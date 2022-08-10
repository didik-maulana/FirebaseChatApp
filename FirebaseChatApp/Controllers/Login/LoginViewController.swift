//
//  LoginViewController.swift
//  FirebaseChatApp
//
//  Created by Didik Maulana Ardiansyah on 04/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.placeholder = "Email Address"
        field.keyboardType = .emailAddress
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.backgroundColor = .white
        field.setHorizontalPadding(8)
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.backgroundColor = .white
        field.setHorizontalPadding(8)
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupNavigationBar()
        initSubviews()
        setupForm()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
    }
}

// MARK: UI Views
extension LoginViewController {
    private func setupNavigationBar() {
        title = "Log In"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Register",
            style: .done,
            target: self, action: #selector(didTapRegister))
    }
    
    private func initSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
    }
    
    private func setupViews() {
        scrollView.frame = view.bounds
        
        let size = scrollView.width / 3
        imageView.frame = CGRect(
            x: (scrollView.width - size) / 2,
            y: 48,
            width: size,
            height: size)
        
        emailField.frame = CGRect(
            x: 30,
            y: imageView.bottom + 48,
            width: scrollView.width - 60,
            height: 48)
        
        passwordField.frame = CGRect(
            x: 30,
            y: emailField.bottom + 16,
            width: scrollView.width - 60,
            height: 48)
        
        loginButton.frame = CGRect(
            x: 30,
            y: passwordField.bottom + 24,
            width: scrollView.width - 60,
            height: 48)
    }
    
    private func setupForm() {
        emailField.delegate = self
        passwordField.delegate = self
        loginButton.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
    }
}

// MARK: UI Actions
extension LoginViewController {
    @objc private func didTapRegister() {
        let registerVC = RegisterViewController()
        registerVC.title = "Create Account"
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc private func performLogin() {
        hideKeyboard()
        
        guard let email = emailField.text,
              let password = passwordField.text,
              !email.isEmpty,
              !password.isEmpty,
              password.count >= 6 else {
            showErrorAlert()
            return
        }
        
        // TODO: Perform Login with Firebase
    }
    
    private func hideKeyboard() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(
            title: "Whoops",
            message: "Please enter all information to log in",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "Dismiss",
            style: .cancel,
            handler: nil))
        
        present(alert, animated: true)
    }
}

// MARK: UITextField Delegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            passwordField.becomeFirstResponder()
        case passwordField:
            performLogin()
        default:
            break
        }
        return true
    }
}
