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
    
    private let rulesView: RulesView = {
        let view = RulesView()
        view.contentMode = .bottom
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rules = [
        ("Все игроки становятся в круг.", nil),
        ("Первый игрок берет телефон и нажимает кнопку:", UIImage(named: "startButton")),
        ("На экране появляется вопрос “Назовите Фрукт”.", nil),
        ("Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.", nil),
        ("Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.", nil),
        ("Проигравшим считается тот, в чьих руках взорвалась бомба.", nil),
        ("Если выбран режим игры “С Заданиями”, то проигравший выполняет задание.", nil)
    ]
    
    //    MARK: - LifeCycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
//        rulesView.delegate = self
        rulesView.isHidden = true
        rulesView.tableView.dataSource = self
        rulesView.tableView.delegate = self
    }
}

extension MainViewController: MainViewDelegate {
    func didTapSettingButton() {
        let categoryVC = CategoryViewController()
        navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    func didTapQuestionButton() {
        //        let rulesVC = RulesViewController()
        //        navigationController?.pushViewController(rulesVC, animated: true)
        rulesView.isHidden = false
        view.addSubview(rulesView)
        NSLayoutConstraint.activate([
            rulesView.heightAnchor.constraint(equalToConstant: 700),
            rulesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rulesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rulesView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func didTapStartButton() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func didTapCategoryButton() {
        let categoryVC = CategoryViewController()
        navigationController?.pushViewController(categoryVC, animated: true)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RulesCell.identifier, for: indexPath) as? RulesCell else {
            return UITableViewCell()
        }
        
        let rule = rules[indexPath.row]
        cell.configureCell(number: indexPath.row + 1, description: createAttributedText(for: rule.0))
        cell.backgroundColor = .customwhite
//        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    private func createAttributedText(for text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
}
