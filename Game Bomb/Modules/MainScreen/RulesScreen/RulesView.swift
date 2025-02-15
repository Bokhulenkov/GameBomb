//
//  RulesView.swift
//  Game Bomb
//
//  Created by Alexander Bokhulenkov on 09.02.2025.
//

import UIKit

protocol RulesViewDelegate: AnyObject {
   func swipeBackButtonTapped()
}

final class RulesView: UIView {
    
    weak var delegate: RulesViewDelegate?
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "helpBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(RulesCell.self, forCellReuseIdentifier: RulesCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backLine"), for: .normal)
        button.contentMode = .top
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var title: UILabel = {
        let label = UILabel()
        label.text = "Правила игры"
        label.textAlignment = .center
        label.textColor = .customDarkGray
        label.font = .custom(font: .bold, size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAction() {
        button.addTarget(self, action: #selector(swipeBackButtonTapped), for: .touchUpInside)
    }
    private func setupViews() {
        backgroundColor = .customGray
        layer.cornerRadius = 30
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.masksToBounds = true
        
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(button)
        backgroundImageView.addSubview(title)
        backgroundImageView.addSubview(tableView)
       
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            button.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: -6),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
          
        ])
    }
}

extension RulesView {
    @objc func swipeBackButtonTapped() {
        delegate?.swipeBackButtonTapped()
    }
}
