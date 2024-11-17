//
//  HoldingsValueBottomsheet.swift
//  HoldingsManager
//
//  Created by Apoorv Joshi on 16/11/24.
//

import Foundation
import UIKit

class HoldingsValueBottomsheet : UIView {
    private var mainStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var topStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var currentValueView = UIView()
    
    private var currentValueTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        label.text = "Current Value"
        return label
    }()
    
    private var currentValueAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private var totalInvestmentView = UIView()
    
    private var totalInvestmentTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        label.text = "Total Investment"
        return label
    }()
    
    private var totalInvestmentAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private var todaysPNLView = UIView()
    
    private var todaysPNLTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        label.text = "Today's Profit & Loss"
        return label
    }()
    
    private var todaysPNLAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private var separatorView = UIView()

    private var separator : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var totalPNLView = UIView()
    
    private var totalPNLTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        label.text = "Profit & Loss"
        return label
    }()
    
    private var totalPNLAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    private var arrowImageContainerView = UIView()
    
    private var arrowImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "UpArrow")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var isExpanded = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadiusAndShadow()
    }
    
    private func setupView() { 
        backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)

        addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
        mainStackView.addArrangedSubview(topStackView)
        
        setupCurrentValueView()
        setupTotalInvestmentView()
        setupTodaysPNLView()
        
        mainStackView.addArrangedSubview(separatorView)
        separatorView.addSubview(separator)
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            separator.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])

        setupTotalPNLView()
        
        topStackView.isHidden = true
        separatorView.isHidden = true
    }
    
    private func setupCurrentValueView() {
        topStackView.addArrangedSubview(currentValueView)
        currentValueView.addSubview(currentValueTitleLabel)
        NSLayoutConstraint.activate([
            currentValueTitleLabel.topAnchor.constraint(equalTo: currentValueView.topAnchor),
            currentValueTitleLabel.leadingAnchor.constraint(equalTo: currentValueView.leadingAnchor),
            currentValueTitleLabel.bottomAnchor.constraint(equalTo: currentValueView.bottomAnchor)
        ])
        currentValueView.addSubview(currentValueAmountLabel)
        NSLayoutConstraint.activate([
            currentValueAmountLabel.topAnchor.constraint(equalTo: currentValueView.topAnchor),
            currentValueAmountLabel.bottomAnchor.constraint(equalTo: currentValueView.bottomAnchor),
            currentValueAmountLabel.trailingAnchor.constraint(equalTo: currentValueView.trailingAnchor)
        ])
    }
    
    private func setupTotalInvestmentView() {
        topStackView.addArrangedSubview(totalInvestmentView)
        currentValueView.addSubview(totalInvestmentTitleLabel)
        NSLayoutConstraint.activate([
            totalInvestmentTitleLabel.topAnchor.constraint(equalTo: totalInvestmentView.topAnchor),
            totalInvestmentTitleLabel.leadingAnchor.constraint(equalTo: totalInvestmentView.leadingAnchor),
            totalInvestmentTitleLabel.bottomAnchor.constraint(equalTo: totalInvestmentView.bottomAnchor)
        ])
        totalInvestmentView.addSubview(totalInvestmentAmountLabel)
        NSLayoutConstraint.activate([
            totalInvestmentAmountLabel.topAnchor.constraint(equalTo: totalInvestmentView.topAnchor),
            totalInvestmentAmountLabel.bottomAnchor.constraint(equalTo: totalInvestmentView.bottomAnchor),
            totalInvestmentAmountLabel.trailingAnchor.constraint(equalTo: totalInvestmentView.trailingAnchor)
        ])
    }
    
    private func setupTodaysPNLView() {
        topStackView.addArrangedSubview(todaysPNLView)
        todaysPNLView.addSubview(todaysPNLTitleLabel)
        NSLayoutConstraint.activate([
            todaysPNLTitleLabel.topAnchor.constraint(equalTo: todaysPNLView.topAnchor),
            todaysPNLTitleLabel.leadingAnchor.constraint(equalTo: todaysPNLView.leadingAnchor),
            todaysPNLTitleLabel.bottomAnchor.constraint(equalTo: todaysPNLView.bottomAnchor)
        ])
        todaysPNLView.addSubview(todaysPNLAmountLabel)
        NSLayoutConstraint.activate([
            todaysPNLAmountLabel.topAnchor.constraint(equalTo: todaysPNLView.topAnchor),
            todaysPNLAmountLabel.bottomAnchor.constraint(equalTo: todaysPNLView.bottomAnchor),
            todaysPNLAmountLabel.trailingAnchor.constraint(equalTo: todaysPNLView.trailingAnchor)
        ])
    }
    
    private func setupTotalPNLView() {
        mainStackView.addArrangedSubview(totalPNLView)
        totalPNLView.addSubview(totalPNLTitleLabel)
        arrowImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        totalPNLView.addSubview(arrowImageContainerView)
        arrowImageContainerView.addSubview(arrowImageView)
        NSLayoutConstraint.activate([
            totalPNLTitleLabel.topAnchor.constraint(equalTo: totalPNLView.topAnchor),
            totalPNLTitleLabel.leadingAnchor.constraint(equalTo: totalPNLView.leadingAnchor),
            totalPNLTitleLabel.bottomAnchor.constraint(equalTo: totalPNLView.bottomAnchor),
            
            arrowImageContainerView.topAnchor.constraint(equalTo: totalPNLView.topAnchor),
            arrowImageContainerView.leadingAnchor.constraint(equalTo: totalPNLTitleLabel.trailingAnchor, constant: 10),
            arrowImageContainerView.bottomAnchor.constraint(equalTo: totalPNLView.bottomAnchor),
            
            arrowImageView.topAnchor.constraint(equalTo: arrowImageContainerView.topAnchor),
            arrowImageView.leadingAnchor.constraint(equalTo: arrowImageContainerView.leadingAnchor),
            arrowImageView.bottomAnchor.constraint(equalTo: arrowImageContainerView.bottomAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: arrowImageContainerView.trailingAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        totalPNLView.addSubview(totalPNLAmountLabel)
        NSLayoutConstraint.activate([
            totalPNLAmountLabel.topAnchor.constraint(equalTo: totalPNLView.topAnchor),
            totalPNLAmountLabel.bottomAnchor.constraint(equalTo: totalPNLView.bottomAnchor),
            totalPNLAmountLabel.trailingAnchor.constraint(equalTo: totalPNLView.trailingAnchor)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(totalPNLViewTapped))
        totalPNLView.addGestureRecognizer(tapGesture)
        totalPNLView.isUserInteractionEnabled = true

    }
    
    private func applyCornerRadiusAndShadow() {
        layer.cornerRadius = 16
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.9
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 16
        
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 0, y: 0))
        shadowPath.addLine(to: CGPoint(x: bounds.width, y: 0))
        shadowPath.addLine(to: CGPoint(x: bounds.width, y: bounds.height / 2))
        shadowPath.addLine(to: CGPoint(x: 0, y: bounds.height / 2))
        shadowPath.close()
        layer.shadowPath = shadowPath.cgPath
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor

    }
    
    func configure(currentValue : Double, totalInvestment: Double, todaysPNL: Double, totalPNL: Double ) {
        currentValueAmountLabel.text = "₹ \(currentValue)"
        totalInvestmentAmountLabel.text = "₹ \(totalInvestment)"
        todaysPNLAmountLabel.attributedText = stylizePNLLabelText(pnl: todaysPNL)
        totalPNLAmountLabel.attributedText = stylizePNLLabelText(pnl: totalPNL, totalInvestment: totalInvestment)
    }
    
    func stylizePNLLabelText(pnl: Double?, totalInvestment: Double = 0.0) -> NSMutableAttributedString {
        
        let value = String(format: "%.2f", pnl ?? 0.00)
        let quantityString = NSMutableAttributedString(string: "₹\(value)")
        
        quantityString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .light), range: NSRange(location: 0, length: quantityString.length))
        quantityString.addAttribute(.foregroundColor, value: (pnl ?? 0.0) < 0 ? UIColor.red : UIColor.green, range: NSRange(location: 0, length: quantityString.length))
        
        if totalInvestment > 0.0 {
            let value = String(format: "%.2f", abs(((pnl ?? 0.0) * 100 )/totalInvestment))
            let percentString = NSMutableAttributedString(string: "(\(value)%)")
            percentString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12, weight: .light), range: NSRange(location: 0, length: percentString.length))
            percentString.addAttribute(.foregroundColor, value: (pnl ?? 0.0) < 0 ? UIColor.red : UIColor.green, range: NSRange(location: 0, length: percentString.length))
            quantityString.append(percentString)
        }
        return quantityString
    }
    
    @objc private func totalPNLViewTapped() {
        isExpanded.toggle()
        
        UIView.animate(withDuration: 0.2, animations: {
            self.topStackView.alpha = self.isExpanded ? 1 : 0
            self.separatorView.alpha = self.isExpanded ? 1 : 0
            
            self.arrowImageView.transform = self.isExpanded ? CGAffineTransform(rotationAngle: .pi) : .identity
        }) { _ in
            self.topStackView.isHidden = !self.isExpanded
            self.separatorView.isHidden = !self.isExpanded
        }
    }

}

