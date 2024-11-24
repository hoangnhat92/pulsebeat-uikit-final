//
//  LoginViewController.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModel
    
    var onLoginCompletion: ((Result<Void, Error>) -> Void)?
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy  var usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
        field.borderStyle = .roundedRect
        return field
    }()
    
    private lazy var passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.borderStyle = .roundedRect
        return field
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(
            self,
            action: #selector(loginTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Label text
        let loginLabel = UILabel()
        loginLabel.text = "Login".uppercased()
        loginLabel.textAlignment = .center
        loginLabel.font = .systemFont(ofSize: 20, weight: .bold)
        loginLabel.numberOfLines = 1
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        // Username field
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginLabel.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(44)
        }
        
        // Password field
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameField.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(44)
        }
        
        // Login button
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordField.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(44)
        }
        
        // Error label
        view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
    
    @objc private func loginTapped() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        viewModel.login(username: username, password: password) { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.errorLabel.text = nil
                    self?.onLoginCompletion?(.success(()))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorLabel.text = error.localizedDescription
                    self?.onLoginCompletion?(.failure(error))
                }
            }
        }
    }
}
