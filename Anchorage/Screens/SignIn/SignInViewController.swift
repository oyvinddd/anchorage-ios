//
//  SignInViewController.swift
//  Anchorage
//
//  Created by Øyvind Hauge on 19/04/2024.
//

import UIKit
import AuthenticationServices

final class SignInViewController: UIViewController {
    
    private lazy var googleButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        button.setTitle("Sign in with Google", for: .normal)
        return button
    }()
    
    private let viewModel: SignInViewModel
    
    init(viewModel: SignInViewModel = SignInViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViews()
        view.backgroundColor = .red
    }
    
    private func setupChildViews() {
        view.addSubview(googleButton)
        
        NSLayoutConstraint.activate([
            googleButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 64),
            googleButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -64),
            googleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func googleButtonTapped() {
        viewModel.startAuthentication(from: self, using: .google)
    }
    
    @objc private func appleButtonTapped() {
        viewModel.startAuthentication(from: self, using: .apple)
    }
}

extension SignInViewController: ASWebAuthenticationPresentationContextProviding {
    
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}