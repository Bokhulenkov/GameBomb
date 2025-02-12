//
//  MainViewController.swift
//  Game Bomb
//
//  Created by Alexander Bokhulenkov on 09.02.2025.
//

import UIKit

final class MainViewController: UIViewController {
    //    MARK: - Properties
    private let mainView = MainView()
    
    //    MARK: - LifeCycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
}

extension MainViewController: MainViewDelegate {
    func didTapSettingButton() {
        let categoryVC = CategoryViewController()
        navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    func didTapQuestionButton() {
        let rulesVC = RulesViewController()
        navigationController?.pushViewController(rulesVC, animated: true)
    }
    
    func didTapStartButton() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func didTapCategoryButton() {
        let categoryVC = CategoryViewController()
        navigationController?.pushViewController(categoryVC, animated: true)
        categoryVC.title = "Категории"
        let backImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.backButtonTitle = ""
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.custom(font: .bold, size: 30),
            .foregroundColor: UIColor.customDarkGray
        ]
        categoryVC.navigationController?.navigationBar.titleTextAttributes = attributes
        
        let rightButtonImage = UIImage(named: "questionYellow")
        let rightButton = UIBarButtonItem(image: rightButtonImage, style: .plain, target: self, action: #selector(didTapRightButton))
        categoryVC.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func didTapRightButton() {
        //Open game rules
    }
    
}

