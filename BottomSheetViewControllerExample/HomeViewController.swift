//
//  HomeViewController.swift
//  BottomSheetViewControllerExample
//
//  Created by Mohd Hafiz on 04/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    private var settings = PageSettings()

    // MARK: - UI
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var showBottomSheetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Bottom Sheet", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        return button
    }()

    private lazy var longTextSwitch: UISwitch = {
        let view = UISwitch()
        return view
    }()

    private lazy var longTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Long text"
        return label
    }()

    private lazy var longTextOptionStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        return view
    }()

    private lazy var hasImageSwitch: UISwitch = {
        let view = UISwitch()
        return view
    }()
    
    private lazy var hasImageLabel: UILabel = {
        let label = UILabel()
        label.text = "Has Image"
        return label
    }()
    
    private lazy var hasImageOptionStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 16
        return view
    }()

    // MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAction()
    }

    private func setupView() {
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

    // MARK: - Actions
    private func setupAction() {
        longTextSwitch.addTarget(self, action: #selector(handleLongTextSwitch), for: .valueChanged)
        hasImageSwitch.addTarget(self, action: #selector(handleHasImageSwitch), for: .valueChanged)
        showBottomSheetButton.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }

    @objc private func handleLongTextSwitch() {
        settings.longText = longTextSwitch.isOn
    }

    @objc private func handleHasImageSwitch() {
        settings.hasImage = hasImageSwitch.isOn
    }

    @objc private func handleButtonTap() {
        let vc = InfoBottomSheetViewController(settings: settings)
        presentBottomSheet(viewController: vc)
    }
}
