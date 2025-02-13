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
        
        setupView()
        setupConstraints()
        buttonPushed()
        
        navigationItem.backButtonDisplayMode = .minimal
        navigationController?.navigationBar.tintColor = UIColor(named: "customPrimaryColor")
    }
    
    //    MARK: - Methods
    private func setupView() {
//        view.addSubview(mainView.button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            mainView.button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            mainView.button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func buttonPushed() {
//        mainView.button.addTarget(self, action: #selector(buttonPush), for: .touchUpInside)
    }
    
    //    MARK: - Actions
    @objc
    private func buttonPush() {
        let gameController = GameViewController()
        navigationController?.pushViewController(gameController, animated: true)
    }
}

// MARK: - Extensions MainViewDelegate
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
            .font: UIFont.custom(font: .bold, size: 28),
            .foregroundColor: UIColor.customDarkGray
        ]
        categoryVC.navigationController?.navigationBar.titleTextAttributes = attributes
        
        let rightButtonImage = UIImage(named: "questionYellow")
        let rightButton = UIBarButtonItem(image: rightButtonImage, style: .plain, target: self, action: #selector(didTapRightButton))
        categoryVC.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func didTapRightButton() {
        let bottomSheetVC = HelpCategoryViewController()
      
        let screenHeight = UIScreen.main.bounds.height
        let sheetHeight: CGFloat = screenHeight * 0.75
        
        bottomSheetVC.modalPresentationStyle = .formSheet
        bottomSheetVC.view.frame = CGRect(x: 0, y: screenHeight, width: view.frame.width, height: sheetHeight)
        
        if let sheet = bottomSheetVC.sheetPresentationController {
//            sheet.prefersGrabberVisible = true
            sheet.detents = [.custom { _ in
                return sheetHeight
            }]
        }
            present(bottomSheetVC, animated: true, completion: nil)
    }
}

