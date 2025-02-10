//
//  MainView.swift
//  Game Bomb
//
//  Created by Alexander Bokhulenkov on 09.02.2025.
//

import UIKit

final class MainView: UIView {
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "customyellowColor")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to Play", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

}
