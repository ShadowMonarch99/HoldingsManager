//
//  HoldingsCell.swift
//  HoldingsManager
//
//  Created by Apoorv Joshi on 16/11/24.
//

import UIKit

class HoldingsCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: HoldingsCell.self)
    
    private var mainContainerStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var leftStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let holdingsNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let netQuantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    private var rightStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.alignment = .trailing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let ltpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    private let pnlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    private var separator : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel = HoldingsCellViewModel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(mainContainerStackView)
        
        
        leftStackView.addArrangedSubview(holdingsNameLabel)
        leftStackView.addArrangedSubview(netQuantityLabel)

        rightStackView.addArrangedSubview(ltpLabel)
        rightStackView.addArrangedSubview(pnlLabel)
        
        mainContainerStackView.addArrangedSubview(leftStackView)
        mainContainerStackView.addArrangedSubview(rightStackView)
        
        contentView.addSubview(separator)
        NSLayoutConstraint.activate([
            mainContainerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mainContainerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            mainContainerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16),
            mainContainerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            separator.topAnchor.constraint(equalTo: mainContainerStackView.bottomAnchor, constant: 0),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    func configure(with nameTitle: String?, netQuantity: Int?,  pnl: Double?, ltp: Double? ) {
        holdingsNameLabel.text = nameTitle
        netQuantityLabel.attributedText = viewModel.stylizeNetQuantityLabelText(netQuantity: netQuantity)
        ltpLabel.attributedText = viewModel.stylizeLTPLabelText(ltp: ltp)
        pnlLabel.attributedText = viewModel.stylizePNLLabelText(pnl: pnl)
    }
}
