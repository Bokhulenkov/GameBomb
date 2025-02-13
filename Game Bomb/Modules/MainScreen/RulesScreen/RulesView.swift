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
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .customWhite
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
        label.textColor = .black
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
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.masksToBounds = true
        
        addSubview(button)
        addSubview(title)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

extension RulesView {
    @objc func swipeBackButtonTapped() {
        delegate?.swipeBackButtonTapped()
    }
}
