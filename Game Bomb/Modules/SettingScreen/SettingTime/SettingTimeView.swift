//
//  SettingTimeView.swift
//  Game Bomb
//
//  Created by Анна on 14.02.2025.
//

import UIKit

enum SettingTimeType: String, CaseIterable {
    case short = "Короткое"
    case medium = "Среднее"
    case long = "Длинное"
    case random = "Случайное"
}

final class SettingTimeView: SettingContainerView {
    // MARK: - GUI Variables
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Время игры".uppercased()
        label.font = .custom(font: .medium, size: 20)
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(SettingTimeViewCell.self, forCellWithReuseIdentifier: "SettingTimeViewCell")
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = true
        
        return collectionView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(collectionView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 13),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            collectionView.heightAnchor.constraint(equalToConstant: getCollectionHeight())
        ])
    }
    
    private func getCollectionHeight() -> CGFloat {
        let itemCount = CGFloat(SettingTimeType.allCases.count)
        let rows = ceil(itemCount / 2)
        let itemHeight: CGFloat = 40
        let spacing: CGFloat = 20 * (rows - 1)
        return rows * itemHeight + spacing
    }
}

//MARK: - UICollectionViewDataSource
extension SettingTimeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SettingTimeType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingTimeViewCell", for: indexPath) as! SettingTimeViewCell
        let type = SettingTimeType.allCases[indexPath.item]
        cell.configure(with: type)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension SettingTimeView: UICollectionViewDelegate {
    
}

//MARK: -  UICollectionViewDelegateFlowLayout
extension SettingTimeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (frame.width - 66) / 2
        return CGSize(width: width, height: 40)
    }
}
