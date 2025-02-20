//
//  SettingMusicViewCell.swift
//  Game Bomb
//
//  Created by Анна on 14.02.2025.
//

import UIKit
import AVFoundation
enum SoundType: String, CaseIterable {
    case music = "background"
    case bomb = "bomb"
    case boom = "boom"
    
    var title: String {
        switch self {
        case .music: return "Фоновая музыка"
        case .bomb: return "Тиканье бомбы"
        case .boom: return "Взрыв бомбы"
        }
    }
    
    var options: [(fileName: String, displayName: String)] {
        switch self {
        case .music:
            return [
                ("none", "Нет"),
                ("background1", "Мелодия 1"),
                ("background2", "Мелодия 2"),
                ("background3", "Мелодия 3")
            ]
        case .bomb:
            return [
                ("analogBomb", "Часы 1"),
                ("soundBomb", "Часы 2"),
                ("ultramanBomb", "Часы 3")
            ]
        case .boom:
            return [
                ("droppingBoom", "Взрыв 1"),
                ("sinusBoom", "Взрыв 2"),
                ("soundBoom", "Взрыв 3")
            ]
        }
    }
    
    var defaultFileName: String {
        switch self {
        case .music: return "background1"
        case .bomb: return "analogBomb"
        case .boom: return "droppingBoom"
        }
    }
}
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
        let actions = type.options.map { option in
            UIAction(title: option.displayName) { _ in
                self.selectedMusicLabel.text = option.displayName
                SettingStorage.shared.save(value: option.fileName, key: type.rawValue)
            }
        }
        return UIMenu(title: "", children: actions)
    }
    
    //MARK: - Methods
    func configure(with config: SettingMusicConfig) {
        titleLabel.text = config.name
        
        if let type = SoundType.allCases.first(where: { $0.title == config.name }) {
            let savedFileName = SettingStorage.shared.get(key: type.rawValue) ?? type.defaultFileName
            let displayName = type.options.first { $0.fileName == savedFileName }?.displayName ?? ""
            selectedMusicLabel.text = displayName
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
