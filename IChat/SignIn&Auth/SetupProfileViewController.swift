//
//  SetupProfileViewController.swift
//  IChat
//
//  Created by Panchenko Oleg on 21.06.2022.
//

import UIKit
import FirebaseAuth

class SetupProfileViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Set up profile!", font: .avenir26())
    
    let fullNameLabel = UILabel(text: "Full Name", font: .avenir20())
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
    
    let fullNameTextField = OneLineTextField(font: .avenir20())
    let aboutMeTextField = OneLineTextField(font: .avenir20())
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    
    let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    let fullImageView = AddPhotoView()
    
    private let currentUser: User
    
    // MARK: - init
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() { 
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
        goToChatsButton.addTarget(self, action: #selector(goToChatsButtonTapped), for: .touchUpInside)
    }
    
    @objc private func goToChatsButtonTapped() {
        FirestoreService.shared.saveProfileWith(
            id: currentUser.uid,
            email: currentUser.email ?? "",
            username: fullNameTextField.text,
            avatarImageString: "nil",
            description: aboutMeTextField.text,
            sex: sexSegmentedControl.titleForSegment(at: sexSegmentedControl.selectedSegmentIndex)) { (result) in
                switch result {
                case .success(let mUser):
                    self.showAlert(with: "Success", and: "Have a good conversation!")
                    print(mUser.username)
                case .failure(let error):
                    self.showAlert(with: "Error", and: error.localizedDescription)
                }
            }
    }
}

//MARK: - Setup Constraints
extension SetupProfileViewController {
    
    private func setupConstraints() {
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 10)
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView,
                                                       aboutMeStackView,
                                                       sexStackView,
                                                       goToChatsButton],
                                    axis: .vertical,
                                    spacing: 40)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(fullImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI

struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all
        )
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileVC = SetupProfileViewController(currentUser: Auth.auth().currentUser!)
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return setupProfileVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
