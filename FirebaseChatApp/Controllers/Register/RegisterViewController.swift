//
//  RegisterViewController.swift
//  FirebaseChatApp
//
//  Created by Didik Maulana Ardiansyah on 04/08/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.placeholder = "Name"
        field.keyboardType = .alphabet
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.backgroundColor = .white
        field.setHorizontalPadding(8)
        return field
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
    
    private lazy var confirmPasswordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.placeholder = "Confirm Password"
        field.isSecureTextEntry = true
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.backgroundColor = .white
        field.setHorizontalPadding(8)
        return field
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initSubviews()
        setupForm()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
    }
}

// MARK: UI Views
extension RegisterViewController {
    private func initSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(nameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(confirmPasswordField)
        scrollView.addSubview(registerButton)
    }
    
    private func setupViews() {
        scrollView.frame = view.bounds
        
        let size = scrollView.width / 3
        imageView.frame = CGRect(
            x: (scrollView.width - size) / 2,
            y: 48,
            width: size,
            height: size)
        
        nameField.frame = CGRect(
            x: 30,
            y: imageView.bottom + 48,
            width: scrollView.width - 60,
            height: 48)
        
        emailField.frame = CGRect(
            x: 30,
            y: nameField.bottom + 16,
            width: scrollView.width - 60,
            height: 48)
        
        passwordField.frame = CGRect(
            x: 30,
            y: emailField.bottom + 16,
            width: scrollView.width - 60,
            height: 48)
        
        confirmPasswordField.frame = CGRect(
            x: 30,
            y: passwordField.bottom + 16,
            width: scrollView.width - 60,
            height: 48)
        
        registerButton.frame = CGRect(
            x: 30,
            y: confirmPasswordField.bottom + 24,
            width: scrollView.width - 60,
            height: 48)
    }
    
    private func setupForm() {
        let tapImageGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapChangePicture))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapImageGesture)
        
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        confirmPasswordField.delegate = self
        registerButton.addTarget(self, action: #selector(performRegister), for: .touchUpInside)
    }
}

// MARK: UI Actions
extension RegisterViewController {
    @objc private func didTapChangePicture() {
        // TODO: Change Profile Picture
    }
    
    @objc private func performRegister() {
        hideKeyboard()
        
        guard let name = nameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              let confirmPassword = confirmPasswordField.text,
              !name.isEmpty,
              !email.isEmpty,
              password.count >= 6,
              confirmPassword.count >= 6,
              password == confirmPassword else {
            showErrorAlert()
            return
        }
        
        // TODO: Perform Register with Firebase
    }
    
    private func hideKeyboard() {
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        confirmPasswordField.resignFirstResponder()
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(
            title: "Whoops",
            message: "Please enter all information to register",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "Dismiss",
            style: .cancel,
            handler: nil))
        
        present(alert, animated: true)
    }
}

// MARK: UITextField Delegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameField:
            emailField.becomeFirstResponder()
        case emailField:
            passwordField.becomeFirstResponder()
        case passwordField:
            confirmPasswordField.becomeFirstResponder()
        case confirmPasswordField:
            performRegister()
        default:
            break
        }
        return true
    }
}
