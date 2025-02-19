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
    
    enum SoundType: String, CaseIterable {
        case music = "Фоновая музыка"
        case bomb = "Тиканье бомбы"
        case boom = "Взрыв бомбы"
        
        var options: [String] {
            switch self {
            case .music:
                return ["Нет", "Мелодия 1", "Мелодия 2", "Мелодия 3"]
            case .bomb:
                return ["Часы 1", "Часы 2", "Часы 3"]
            case .boom:
                return ["Взрыв 1", "Взрыв 2", "Взрыв 3"]
            }
        }
    }
    
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
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "next"), for: .normal)
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
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
    
    func createMenu(for type: SoundType) -> UIMenu {
        let actions = type.options.map { options in
            UIAction(title: options, handler: { _ in
                self.selectedMusicLabel.text = options
            })
        }
        return UIMenu(title: "", children: actions)
    }
    
    //MARK: - Methods
    func configure(with config: SettingMusicConfig) {
        setting = config
        titleLabel.text = config.name
        selectedMusicLabel.text = config.currentValue
        
        if let type = SoundType(rawValue: config.name) {
            nextButton.menu = createMenu(for: type)
        }
    }
}

// MARK: - Extensions Constraints
private extension SettingMusicViewCell {
    func setupConstraints() {
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
}
