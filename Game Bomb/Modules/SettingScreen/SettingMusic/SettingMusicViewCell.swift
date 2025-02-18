//
//  SettingMusicViewCell.swift
//  Game Bomb
//
//  Created by Анна on 14.02.2025.
//

import UIKit
import AVFoundation

class SettingMusicViewCell: UICollectionViewCell {
//    MARK: - Properties
    private var setting: SettingMusicConfig?
    
    // MARK: - GUI Variables
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .custom(font: .bold, size: 16)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var selectedMusicLabel: UILabel = {
        let label = UILabel()
        label.font = .custom(font: .regular, size: 14)
        label.textColor = .CustomColors.lightGray
        label.textAlignment = .right
        
        
        return label
    }()
    var menuItems: [UIAction] {
        return [
            UIAction(title: "Мелодия 1", image: nil, handler: { (_) in
            }),
            UIAction(title: "Мелодия 2", image: nil,  handler: { (_) in
            }),
            UIAction(title: "Мелодия 3", image: nil, handler: { (_) in
            })
        ]
    }

    var demoMenu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "next"), for: .normal)
        button.menu = demoMenu
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
#warning("вот метод который срабатывает при нажатии на селектор у кнопок")
        nextButton.addTarget(self, action: #selector(tapedButton), for: .touchUpInside)
        backgroundColor = .CustomColors.darkGray
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(selectedMusicLabel)
        addSubview(nextButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        selectedMusicLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
            
            selectedMusicLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -7),
            selectedMusicLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            nextButton.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13),
        ])
    }
    
    //MARK: - Methods
    func configure(with config: SettingMusicConfig) {
        setting = config
        titleLabel.text = config.name
        selectedMusicLabel.text = config.currentValue
    }
    
//    MARK: - Actions
    @objc private func tapedButton(_ sender: UIButton) {
        guard let setting else { return }
#warning("Здесь мы сохраняем значение у кнопки которую нажали")
        SettingStorage.shared.save(value: setting.currentValue, key: setting.name)
        
        
        print("taped button")
    }
}
