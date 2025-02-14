//
//  RulesCell.swift
//  Game Bomb
//
//  Created by Екатерина Орлова on 12.02.2025.
//

import UIKit

 class RulesCell: UITableViewCell {
    
    static let identifier = "RulesCellIdentifier"
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .mainBackground
        label.font = .custom(font: .bold, size: 16)
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     let imageButton: UIImageView = {
         let image = UIImageView()
         image.contentMode = .scaleAspectFill
         image.translatesAutoresizingMaskIntoConstraints = false
         return image
     }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //    MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        shadowView.addSubview(numberLabel)
        contentView.addSubview(shadowView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(imageButton)
        
        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shadowView.widthAnchor.constraint(equalToConstant: 29),
            shadowView.heightAnchor.constraint(equalToConstant: 29),

            numberLabel.centerXAnchor.constraint(equalTo: shadowView.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: shadowView.centerYAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: 29),
            numberLabel.heightAnchor.constraint(equalToConstant: 29),

            descriptionLabel.leadingAnchor.constraint(equalTo: shadowView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            imageButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            imageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageButton.heightAnchor.constraint(equalToConstant: 20),
            imageButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
     func configureCell(number: Int, description: NSAttributedString?, image: UIImage?) {
         numberLabel.text = "\(number)"
         descriptionLabel.attributedText = description
         imageButton.image = image
     }
}
