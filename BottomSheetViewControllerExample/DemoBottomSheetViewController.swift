//
//  DemoBottomSheetViewController.swift
//  BottomSheetViewControllerExample
//
//  Created by Mohd Hafiz on 04/06/2023.
//

import UIKit

class DemoBottomSheetViewController: BottomSheetViewController {
    // MARK: - Properties
    var settings = PageSettings()
    
    // MARK: - UI
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = MockData.pageTitle
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = MockData.pageSubtitle
        return label
    }()
    
    lazy var topLabelStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        view.addArrangedSubview(titleLabel)
        view.addArrangedSubview(descriptionLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    private let headerImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "sampleImage"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()

    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("Dismiss", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(handleDismissButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        return button
    }()

    private lazy var contentStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
    
    // MARK: - Init and setup
    init(settings: PageSettings) {
        self.settings = settings
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        // Main content to be added in bottom sheet
        contentStackView.addArrangedSubview(topLabelStackView)
        contentStackView.addArrangedSubview(headerImageView)
        contentStackView.addArrangedSubview(bodyLabel)
        contentStackView.addArrangedSubview(dismissButton)
        bodyLabel.text = settings.longText ? MockData.longText : MockData.shortText
        headerImageView.isHidden = !settings.hasImage
        
        // Call bottom sheet function to set the intended content
        self.setContent(content: contentStackView)
    }

    @objc private func handleDismissButton() {
        self.dismissBottomSheet()
    }
}
