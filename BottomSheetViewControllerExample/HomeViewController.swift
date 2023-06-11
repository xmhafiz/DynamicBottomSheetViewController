//
//  HomeViewController.swift
//  BottomSheetViewControllerExample
//
//  Created by Mohd Hafiz on 04/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    let settings = PageSettings()

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var showBottomSheetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Bottom Sheet", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        return button
    }()

    lazy var longTextSwitch: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var longTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Long text"
        return label
    }()

    lazy var longTextOptionStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        return view
    }()

    lazy var hasImageSwitch: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var hasImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Has Image"
        return label
    }()
    
    lazy var hasImageOptionStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAction()
    }

    func setupView() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    
        stackView.addArrangedSubview(longTextOptionStackView)
        stackView.addArrangedSubview(hasImageOptionStackView)
        stackView.addArrangedSubview(showBottomSheetButton)
    
        hasImageOptionStackView.addArrangedSubview(hasImageSwitch)
        hasImageOptionStackView.addArrangedSubview(hasImageLabel)
    
        longTextOptionStackView.addArrangedSubview(longTextSwitch)
        longTextOptionStackView.addArrangedSubview(longTextLabel)
    }

    func setupAction() {
        longTextSwitch.addTarget(self, action: #selector(handleLongTextSwitch), for: .valueChanged)
        hasImageSwitch.addTarget(self, action: #selector(handleHasImageSwitch), for: .valueChanged)
        showBottomSheetButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc func handleLongTextSwitch() {
        settings.longText = longTextSwitch.isOn
    }

    @objc func handleHasImageSwitch() {
        settings.hasImage = hasImageSwitch.isOn
    }

    @objc func handleButtonTap() {
        let vc = InfoBottomSheetViewController(settings: settings)
        presentBottomSheet(viewController: vc)
    }
}
